import { JupyterFrontEnd, JupyterFrontEndPlugin } from '@jupyterlab/application';
import { ICodeCellModel } from '@jupyterlab/cells';
import { INotebookTracker, NotebookPanel } from '@jupyterlab/notebook';
import { Range, StateField } from '@codemirror/state';
import { Decoration, DecorationSet, EditorView } from '@codemirror/view';

const PLUGIN_ID = '@majordome/jupyterlab-mdmagic:plugin';

// Mirrors Python MdMagic.MATH_BLOCKS_RE: $$...$$ then $...$, DOTALL equivalent
const MATH_RE = /\$\$[\s\S]*?\$\$|\$[^$]*?\$/g;

// Mirrors Python MdMagic.PLACEHOLDER_RE: {content} with no nested braces
const BRACE_RE = /\{([^{}\n]+)\}/g;

const braceMark = Decoration.mark({
  class: 'cm-mj-mdmagic-brace'
});

const expressionMark = Decoration.mark({
  class: 'cm-mj-mdmagic-expression'
});

const colonMark = Decoration.mark({
  class: 'cm-mj-mdmagic-colon'
});

const formatSpecMark = Decoration.mark({
  class: 'cm-mj-mdmagic-format-spec'
});

/**
 * Mirrors Python MdMagic.split_unescaped_colon:
 * returns true when content contains a colon not preceded by an odd number
 * of backslashes, meaning a format spec like {value:.2f} is present.
 */
function splitUnescapedColonIndex(content: string): number {
  for (let i = 0; i < content.length; i++) {
    if (content[i] !== ':') {
      continue;
    }

    let backslashes = 0;
    for (let j = i - 1; j >= 0 && content[j] === '\\'; j--) {
      backslashes++;
    }

    if (backslashes % 2 === 0) {
      return i;
    }
  }

  return -1;
}

function addRange(
  ranges: Range<Decoration>[],
  mark: Decoration,
  from: number,
  to: number
): void {
  if (to > from) {
    ranges.push(mark.range(from, to));
  }
}

function addPlaceholderRanges(
  ranges: Range<Decoration>[],
  start: number,
  end: number,
  content: string,
  requireSpec: boolean
): void {
  const colonIdx = splitUnescapedColonIndex(content);
  if (requireSpec && colonIdx < 0) {
    return;
  }

  const openBraceStart = start;
  const openBraceEnd = start + 1;
  const closeBraceStart = end - 1;
  const closeBraceEnd = end;

  addRange(ranges, braceMark, openBraceStart, openBraceEnd);
  addRange(ranges, braceMark, closeBraceStart, closeBraceEnd);

  if (colonIdx < 0) {
    addRange(ranges, expressionMark, start + 1, end - 1);
    return;
  }

  const colonPos = start + 1 + colonIdx;
  addRange(ranges, expressionMark, start + 1, colonPos);
  addRange(ranges, colonMark, colonPos, colonPos + 1);
  addRange(ranges, formatSpecMark, colonPos + 1, end - 1);
}

function buildPlaceholderDecorations(doc: string): DecorationSet {
  if (!isMdMagicCell(doc)) {
    return Decoration.none;
  }

  // Collect math block character ranges, mirroring Python MATH_BLOCKS_RE
  const mathRanges: [number, number][] = [];
  MATH_RE.lastIndex = 0;
  let mathMatch = MATH_RE.exec(doc);
  while (mathMatch !== null) {
    mathRanges.push([mathMatch.index, mathMatch.index + mathMatch[0].length]);
    mathMatch = MATH_RE.exec(doc);
  }

  function isInsideMath(start: number, end: number): boolean {
    return mathRanges.some(([s, e]) => start >= s && end <= e);
  }

  const ranges: Range<Decoration>[] = [];
  BRACE_RE.lastIndex = 0;
  let match = BRACE_RE.exec(doc);
  while (match !== null) {
    const start = match.index;
    const end = start + match[0].length;
    const content = match[1];

    if (isInsideMath(start, end)) {
      // Inside math blocks only {expr:spec} is interpolated by the backend.
      // Plain {expr} and LaTeX constructs like \frac{a}{b} are left untouched.
      addPlaceholderRanges(ranges, start, end, content, true);
    } else {
      // Outside math blocks both {expr} and {expr:spec} are interpolated.
      addPlaceholderRanges(ranges, start, end, content, false);
    }

    match = BRACE_RE.exec(doc);
  }

  return Decoration.set(ranges, true);
}

const placeholderDecorations = StateField.define<DecorationSet>({
  create(state) {
    return buildPlaceholderDecorations(state.doc.toString());
  },

  update(decorations, transaction) {
    if (!transaction.docChanged) {
      return decorations;
    }

    return buildPlaceholderDecorations(transaction.state.doc.toString());
  },

  provide: field => EditorView.decorations.from(field)
});

function firstMeaningfulLine(text: string): string {
  const lines = text.split(/\r?\n/);

  for (const rawLine of lines) {
    const line = rawLine.trim();

    if (!line) {
      continue;
    }

    if (line.startsWith('#|')) {
      continue;
    }

    return line;
  }

  return '';
}

function stripMagicHeader(text: string): string {
  return text.replace(/^\s*(?:#\|.*\n)*\s*%%md\s*/m, '').trim();
}

function isMdMagicCell(text: string): boolean {
  return firstMeaningfulLine(text).startsWith('%%md');
}

function chooseMimeTypeForMdMagic(text: string): string {
  const body = stripMagicHeader(text);

  if (body.startsWith('$$') && body.endsWith('$$')) {
    return 'text/x-latex';
  }

  return 'text/markdown';
}

function syncCellMimeType(
  cell: any,
  originalMime: WeakMap<ICodeCellModel, string>
): void {
  const model = cell.model as ICodeCellModel;
  const editorModel = cell.editor?.model;

  if (!editorModel) {
    return;
  }

  if (!originalMime.has(model)) {
    originalMime.set(model, editorModel.mimeType || model.mimeType || 'text/x-python');
  }

  const source = model.sharedModel.getSource();

  if (isMdMagicCell(source)) {
    editorModel.mimeType = chooseMimeTypeForMdMagic(source);
    return;
  }

  const fallback = originalMime.get(model);
  if (fallback) {
    editorModel.mimeType = fallback;
  }
}

function syncCellWrapping(cell: any, originalWrap: WeakMap<object, string>): void {
  const editor = cell.editor as any;
  if (!editor || typeof editor.getOption !== 'function' || typeof editor.setOption !== 'function') {
    return;
  }

  if (!originalWrap.has(editor)) {
    const wrapValue = editor.getOption('lineWrap');
    originalWrap.set(editor, typeof wrapValue === 'string' ? wrapValue : 'off');
  }

  const source = (cell.model as ICodeCellModel).sharedModel.getSource();

  if (isMdMagicCell(source)) {
    editor.setOption('lineWrap', 'on');
    return;
  }

  const fallback = originalWrap.get(editor) || 'off';
  editor.setOption('lineWrap', fallback);
}

function ensurePlaceholderDecoration(cell: any, wiredEditors: WeakSet<object>): void {
  const editor = cell.editor as any;
  if (!editor || wiredEditors.has(editor)) {
    return;
  }

  if (typeof editor.injectExtension !== 'function') {
    return;
  }

  editor.injectExtension(placeholderDecorations);
  wiredEditors.add(editor);
}

function wireNotebook(
  panel: NotebookPanel,
  originalMime: WeakMap<ICodeCellModel, string>,
  wiredModels: WeakSet<ICodeCellModel>,
  wiredEditors: WeakSet<object>,
  originalWrap: WeakMap<object, string>
): void {
  const notebook = panel.content;

  const refresh = (): void => {
    for (const cell of notebook.widgets) {
      if (cell.model.type !== 'code') {
        continue;
      }

      const model = cell.model as ICodeCellModel;
      ensurePlaceholderDecoration(cell, wiredEditors);
      syncCellMimeType(cell, originalMime);
      syncCellWrapping(cell, originalWrap);

      if (wiredModels.has(model)) {
        continue;
      }

      model.contentChanged.connect(() => {
        syncCellMimeType(cell, originalMime);
        syncCellWrapping(cell, originalWrap);
      });

      wiredModels.add(model);
    }
  };

  refresh();

  notebook.model?.cells.changed.connect(() => {
    refresh();
  });

  notebook.activeCellChanged.connect(() => {
    refresh();
  });
}

const plugin: JupyterFrontEndPlugin<void> = {
  id: PLUGIN_ID,
  autoStart: true,
  requires: [INotebookTracker],
  activate: (_app: JupyterFrontEnd, tracker: INotebookTracker) => {
    const originalMime = new WeakMap<ICodeCellModel, string>();
    const wiredModels = new WeakSet<ICodeCellModel>();
    const wiredEditors = new WeakSet<object>();
    const originalWrap = new WeakMap<object, string>();

    tracker.widgetAdded.connect((_sender: INotebookTracker, panel: NotebookPanel) => {
      void panel.context.ready.then(() => {
        wireNotebook(panel, originalMime, wiredModels, wiredEditors, originalWrap);
      });
    });

    tracker.forEach((panel: NotebookPanel) => {
      void panel.context.ready.then(() => {
        wireNotebook(panel, originalMime, wiredModels, wiredEditors, originalWrap);
      });
    });
  }
};

export default plugin;
