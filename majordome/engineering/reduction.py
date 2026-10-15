# -*- coding: utf-8 -*-
""" Reaction mechanism reduction and graph analysis tools. """

import csv
from itertools import combinations, product
from pathlib import Path
import time
from typing import Any, Callable, Mapping, Sequence

import cantera as ct
from matplotlib import pyplot
from matplotlib.ticker import MaxNLocator
import networkx as nx
import numpy as np
import pandas as pd

from ..utilities import MajordomePlot, majordome_warning as warn


def extract_submechanism(
    sol_or_mech: ct.Solution | Path | str,
    retained_species: Sequence[str] | None = None,
    yaml_out: Path | str | None = None
) -> ct.Solution:
    """ Extract a skeletal submechanism retaining specified species.

    Parameters
    ----------
    sol_or_mech : ct.Solution | Path | str
        Input Cantera solution instance or mechanism file path.
    retained_species : Sequence[str] | None = None
        List of species names to retain. If None, original is returned.
    yaml_out : Path | str | None = None
        Path to output YAML file if serialization is requested.

    Returns
    -------
    ct.Solution
        Extracted submechanism Cantera solution object.
    """
    if isinstance(sol_or_mech, (ct.Solution, ct.composite.Solution)):
        sol = sol_or_mech
    else:
        sol = ct.Solution(str(sol_or_mech))

    if retained_species is None:
        if yaml_out is not None:
            sol.write_yaml(str(yaml_out))
        return sol

    species_set = set(retained_species)
    species_objs = [s for s in sol.species() if s.name in species_set]

    reaction_objs = [
        rxn for rxn in sol.reactions()
        if all(s in species_set for s in rxn.reactants)
        and all(s in species_set for s in rxn.products)
    ]

    sub_sol = ct.Solution(
        thermo="ideal-gas",
        kinetics="gas",
        species=species_objs,
        reactions=reaction_objs,
    )

    if yaml_out is not None:
        sub_sol.write_yaml(str(yaml_out))

    return sub_sol


filter_mechanism = extract_submechanism


class MechanismFilter:
    """ Mechanism filter wrapper for submechanism extraction.

    Parameters
    ----------
    mech : Path | str | ct.Solution
        Mechanism file path or Cantera solution.
    """

    __slots__ = ('_mech',)

    def __init__(self, mech: Path | str | ct.Solution) -> None:
        # XXX no documentation here, this is intentional
        self._mech = mech

    def filter(
        self,
        species_filter: Sequence[str] | None = None,
        output: Path | str | None = None,
        **kwargs: object
    ) -> ct.Solution:
        """ Filter mechanism to retain only selected species.

        Parameters
        ----------
        species_filter : Sequence[str] | None = None
            List of species names to retain.
        output : Path | str | None = None
            Path to output YAML file.

        Returns
        -------
        ct.Solution
            Extracted submechanism Cantera solution object.
        """
        return extract_submechanism(
            self._mech, species_filter, yaml_out=output
        )


def plot_adjmatrix(
    adjmat: np.ndarray,
    saveas: Path | str | None = None,
    overwrite: bool = True,
    figsize: tuple[int, int] = (6, 6),
    cmap: str = 'Blues',
    dpi: int = 300
) -> None:
    """ Plot graph adjacency matrix.

    Parameters
    ----------
    adjmat : np.ndarray
        Graph adjacency matrix.
    saveas : Path | str | None = None
        Destination image file path.
    overwrite : bool = True
        Allow overwriting existing output file.
    figsize : tuple[int, int] = (6, 6)
        Figure dimensions in inches.
    cmap : str = 'Blues'
        Colormap name.
    dpi : int = 300
        Output resolution.
    """
    if saveas is not None:
        out_path = Path(saveas)
        if not overwrite and out_path.exists():
            raise FileExistsError(f'Cannot overwrite: {out_path}')

    pyplot.close('all')
    fig, ax = pyplot.subplots(figsize=figsize)
    ax.imshow(adjmat, cmap=cmap)
    ax.axes.get_xaxis().set_visible(False)
    ax.axes.get_yaxis().set_visible(False)
    fig.subplots_adjust(top=1.0, bottom=0.0, right=1.0, left=0.0)

    if saveas is not None:
        pyplot.savefig(Path(saveas), dpi=dpi)


def plot_deghist(
    deghist: Sequence[int | float],
    saveas: Path | str | None = None,
    overwrite: bool = True,
    figsize: tuple[int, int] = (6, 6),
    color: str = 'k',
    dpi: int = 300,
    xlim: tuple[float, float] | None = None
) -> None:
    """ Plot degrees histogram of graph nodes.

    Parameters
    ----------
    deghist : Sequence[int | float]
        Histogram count sequence indexed by degree.
    saveas : Path | str | None = None
        Destination image file path.
    overwrite : bool = True
        Allow overwriting existing output file.
    figsize : tuple[int, int] = (6, 6)
        Figure dimensions in inches.
    color : str = 'k'
        Bar plot color.
    dpi : int = 300
        Output resolution.
    xlim : tuple[float, float] | None = None
        X-axis limits (min, max).
    """
    if saveas is not None:
        out_path = Path(saveas)
        if not overwrite and out_path.exists():
            raise FileExistsError(f'Cannot overwrite: {out_path}')

    pyplot.close('all')
    fig, ax = pyplot.subplots(figsize=figsize)
    x_coords = np.arange(0, len(deghist), 1)
    ax.bar(x_coords, deghist, color=color)
    ax.set_xlabel('Degree')
    ax.set_ylabel('Counts')

    if xlim is not None:
        ax.set_xlim(xlim[0], xlim[1])

    ax.xaxis.set_major_locator(MaxNLocator(integer=True))
    ax.yaxis.set_major_locator(MaxNLocator(integer=True))
    pyplot.tight_layout()

    if saveas is not None:
        pyplot.savefig(Path(saveas), dpi=dpi)


class BaseGraph(nx.Graph):
    """ Base class for chemical species reaction graphs.

    Parameters
    ----------
    sol : ct.Solution
        Solution object representing the kinetics mechanism.
    fullfmt : bool = False
        Print all edges in string representation if True.
    """

    __slots__ = ('_sol', '_fullfmt')

    def __init__(self, sol: ct.Solution, fullfmt: bool = False) -> None:
        # XXX no documentation here, this is intentional
        super().__init__()
        self._sol = sol
        self._fullfmt = fullfmt
        self.add_nodes_from(self._sol.species_names)

    def __str__(self) -> str:
        basefmt = (
            f' {self.__class__.__name__} object\n'
            f' -- Size   : {self.size()}\n'
            f' -- Order  : {self.order()}\n'
        )

        if not self._fullfmt:
            return basefmt

        more = map(lambda e: f' {e[0]:>20s} - {e[1]:s}\n', self.edges())
        return basefmt + ''.join(more)

    def adjacency_matrix(self) -> np.ndarray:
        """ Return graph adjacency matrix.

        Returns
        -------
        np.ndarray
            Adjacency matrix of interacting nodes.
        """
        return nx.to_numpy_array(self)

    def degree_histogram(self) -> list[int]:
        """ Return histogram of node degrees.

        Returns
        -------
        list[int]
            List indexed by degree with counts of its occurrences.
        """
        return nx.degree_histogram(self)

    def ordered_degree(self) -> list[tuple[str, int]]:
        """ Return nodes ordered by degree descending.

        Returns
        -------
        list[tuple[str, int]]
            Pairs of (node, degree) ordered descending.
        """
        baselist = [(v, self.degree(v)) for v in self]
        return sorted(baselist, key=lambda x: x[1], reverse=True)

    @property
    def density(self) -> float:
        """ Return graph density.

        Returns
        -------
        float
            Graph density.
        """
        return float(nx.density(self))

    def plot_adjmatrix(
        self,
        saveas: Path | str,
        overwrite: bool = True,
        **kwargs: object
    ) -> None:
        """ Plot graph adjacency matrix.

        Parameters
        ----------
        saveas : Path | str
            Destination image file path.
        overwrite : bool = True
            Allow overwriting existing output file.
        kwargs : object
            Additional plotting options.
        """
        adjmat = nx.to_numpy_array(self)
        plot_adjmatrix(adjmat, saveas=saveas, overwrite=overwrite, **kwargs)

    def plot_deghist(
        self,
        saveas: Path | str,
        overwrite: bool = True,
        **kwargs: object
    ) -> None:
        """ Plot node degree histogram.

        Parameters
        ----------
        saveas : Path | str
            Destination image file path.
        overwrite : bool = True
            Allow overwriting existing output file.
        kwargs : object
            Additional plotting options.
        """
        deghist = nx.degree_histogram(self)
        plot_deghist(deghist, saveas=saveas, overwrite=overwrite, **kwargs)

    @property
    def solution(self) -> ct.Solution:
        """ Return associated Cantera solution.

        Returns
        -------
        ct.Solution
            Associated kinetics solution.
        """
        return self._sol


class DirectedGraph(nx.DiGraph, BaseGraph):
    """ Generate species directed relational graph.

    Parameters
    ----------
    sol : ct.Solution
        Solution object representing the kinetics mechanism.
    fullfmt : bool = False
        Print all edges in string representation if True.
    """

    __slots__ = ()

    def __init__(self, sol: ct.Solution, fullfmt: bool = False) -> None:
        # XXX no documentation here, this is intentional
        super().__init__()
        self._sol = sol
        self._fullfmt = fullfmt
        self.add_nodes_from(self._sol.species_names)

        for r in self._sol.reactions():
            reac = list(r.reactants.keys())
            prod = list(r.products.keys())
            spec = reac + prod

            self._add_edges(reac, spec)

            if r.reversible:
                self._add_edges(prod, spec)

    def _add_edges(self, src, dst):
        src_arr = np.array(src)
        dst_arr = np.array(dst)

        for b in src_arr:
            for a in dst_arr[dst_arr != b]:
                self.add_edge(a, b, val=0.0)

    def update_edges(
        self,
        src: Sequence[str],
        dst: Sequence[str],
        func: Callable[[str, str], float]
    ) -> None:
        """ Update edge weights.

        Parameters
        ----------
        src : Sequence[str]
            Source node names.
        dst : Sequence[str]
            Destination node names.
        func : Callable[[str, str], float]
            Weight increment function (A, B) -> delta.
        """
        src_arr = np.array(src)
        dst_arr = np.array(dst)

        for b in src_arr:
            for a in dst_arr[dst_arr != b]:
                self.edges[a, b]['val'] += func(a, b)

    def divide_edges(
        self,
        func: Callable[[str, str], float],
        verbose: bool = False
    ) -> None:
        """ Divide edge weights by function values.

        Parameters
        ----------
        func : Callable[[str, str], float]
            Denominator function taking nodes A and B.
        verbose : bool = False
            Print warning messages if True.
        """
        for a, b in self.edges():
            val = func(a, b)

            if val == 0.0:
                if verbose:
                    warn(f'Zero denominator for {a}->{b}. Setting 1.')
                self.edges[a, b]['val'] = 1.0
                continue

            ratio = self.edges[a, b]['val'] / val if val != 0.0 else 1.0
            self.edges[a, b]['val'] = min(ratio, 1.0)

    def sort_edges(
        self,
        func: Callable[[tuple[str, str, float]], Any] | None = None,
        w: str = 'val',
        reverse: bool = True
    ) -> list[tuple[str, str, float]]:
        """ Sort graph edges by property.

        Parameters
        ----------
        func : Callable[[tuple[str, str, float]], Any] | None = None
            Sorting key function.
        w : str = 'val'
            Edge attribute name.
        reverse : bool = True
            Sort descending if True.

        Returns
        -------
        list[tuple[str, str, float]]
            List of sorted edges (A, B, weight).
        """
        def mapper(edge):
            a, b = edge
            return (a, b, self.edges[a, b][w])

        key_func = func if func is not None else lambda pars: pars[2]
        baselist = list(map(mapper, self.edges()))
        return sorted(baselist, key=key_func, reverse=reverse)

    def ordered_in_degree(self) -> list[tuple[str, int]]:
        """ Return nodes ordered by in-degree descending.

        Returns
        -------
        list[tuple[str, int]]
            Pairs of (node, in-degree) ordered descending.
        """
        baselist = [(v, self.in_degree(v)) for v in self]
        return sorted(baselist, key=lambda x: x[1], reverse=True)

    def ordered_out_degree(self) -> list[tuple[str, int]]:
        """ Return nodes ordered by out-degree descending.

        Returns
        -------
        list[tuple[str, int]]
            Pairs of (node, out-degree) ordered descending.
        """
        baselist = [(v, self.out_degree(v)) for v in self]
        return sorted(baselist, key=lambda x: x[1], reverse=True)

    def reinitialize_graph(self) -> None:
        """ Reset all edge values to zero. """
        for a, b in self.edges():
            self.edges[a, b]['val'] = 0.0


class UndirectedGraph(BaseGraph):
    """ Generate species undirected relational graph.

    Parameters
    ----------
    sol : ct.Solution
        Solution object representing the kinetics mechanism.
    fullfmt : bool = True
        Print all edges in string representation if True.
    """

    __slots__ = ()

    def __init__(self, sol: ct.Solution, fullfmt: bool = True) -> None:
        # XXX no documentation here, this is intentional
        super().__init__(sol, fullfmt=fullfmt)

        for r in self._sol.reactions():
            reac = r.reactants.keys()
            prod = r.products.keys()
            spec = list(reac) + list(prod)

            for p, q in combinations(spec, 2):
                if (p, q) not in self and (p != q):
                    self.add_edge(p, q)


def analyse_graph(
    mech: Path | str | ct.Solution,
    graph_class: type[BaseGraph] = DirectedGraph,
    **kwargs: object
) -> BaseGraph:
    """ Perform species graph analysis.

    Parameters
    ----------
    mech : Path | str | ct.Solution
        Mechanism file path or Cantera solution.
    graph_class : type[BaseGraph] = DirectedGraph
        Graph class to construct.
    kwargs : object
        Optional species filtering and output options.

    Returns
    -------
    BaseGraph
        Constructed and analyzed graph instance.
    """
    saveas = kwargs.get('saveas', None)
    species = kwargs.get('species', None)
    species_seq = list(species) if species is not None else None

    sol = extract_submechanism(mech, species_seq)
    mgraph = graph_class(sol)

    if saveas is not None:
        save_path = Path(str(saveas))
        save_stem = str(save_path)
        save_path.parent.mkdir(parents=True, exist_ok=True)

        if isinstance(mgraph, DirectedGraph):
            in_path = Path(f'{save_stem}-inward.txt')
            with in_path.open('w', encoding='utf-8') as w:
                for v, d in mgraph.ordered_in_degree():
                    w.write(f'{v:16s} {d:4d}\n')

            out_path = Path(f'{save_stem}-outward.txt')
            with out_path.open('w', encoding='utf-8') as w:
                for v, d in mgraph.ordered_out_degree():
                    w.write(f'{v:16s} {d:4d}\n')

        with Path(f'{save_stem}-global.txt').open('w', encoding='utf-8') as w:
            for v, d in mgraph.ordered_degree():
                w.write(f'{v:16s} {d:4d}\n')

        with Path(f'{save_stem}-report.txt').open('w', encoding='utf-8') as w:
            basestr = (
                f'Species graph contains {mgraph.size()} edges\n'
                f'Species graph contains {mgraph.order()} nodes\n'
                f'Species graph density  {mgraph.density}\n'
            )
            w.write(basestr)

        mgraph.plot_deghist(Path(f'{save_stem}-histogram.png'))
        mgraph.plot_adjmatrix(Path(f'{save_stem}-adjacency.png'))

    return mgraph


class StateSpace:
    """ Represent initial state space for mechanism simplification.

    Parameters
    ----------
    t : list[float] | None = None
        List of temperatures in kelvin.
    p : list[float] | None = None
        List of pressures in pascal.
    x : list[Mapping[str, float] | str] | None = None
        List of initial gas compositions.
    """

    __slots__ = ('T', 'P', 'X')

    def __init__(
        self,
        t: list[float] | None = None,
        p: list[float] | None = None,
        x: list[Mapping[str, float] | str] | None = None
    ) -> None:
        # XXX no documentation here, this is intentional
        self.T = t
        self.P = p
        self.X = x


class SimplifySetup:
    """ Configuration for mechanism simplification workflow.

    Parameters
    ----------
    start_set : list[str] | None = None
        Species to retain in simplified mechanism.
    space : StateSpace | None = None
        State space conditions to scan.
    """

    __slots__ = (
        'start_set',
        'plot_spec',
        'space',
        'integ',
        'nsimp',
        'threshold_min',
        'threshold_max',
        'species_filter',
        'dir_name'
    )

    def __init__(
        self,
        start_set: list[str] | None = None,
        space: StateSpace | None = None
    ) -> None:
        # XXX no documentation here, this is intentional
        self.start_set = start_set
        self.plot_spec: list[str] | None = None
        self.space = space
        self.integ: float | None = None
        self.nsimp: int | None = None
        self.threshold_min: float | None = None
        self.threshold_max: float | None = None
        self.species_filter: list[str] | None = None
        self.dir_name: Path | str | None = None

    def validate(self) -> None:
        """ Validate configuration settings. """
        if self.start_set is None:
            raise ValueError('Missing species start set')

        if self.threshold_max is None or self.threshold_min is None:
            raise ValueError('Missing threshold settings')

        if self.threshold_max <= self.threshold_min:
            msg = f'max {self.threshold_max} <= min {self.threshold_min}'
            raise ValueError(f'Threshold: {msg}')


class SimplifyDRG:
    """ Directed Relation Graph mechanism simplification operator.

    Parameters
    ----------
    graph : DirectedGraph
        Directed graph of kinetic mechanism.
    start_set : Sequence[str]
        Species to keep in simplified mechanism.
    """

    __slots__ = (
        '_graph',
        '_start',
        '_names',
        '_reactions',
        '_nu',
        '_nu_dict'
    )

    def __init__(
        self,
        graph: DirectedGraph,
        start_set: Sequence[str]
    ) -> None:
        # XXX no documentation here, this is intentional
        self._graph = graph
        self._start = list(set(start_set))

        nu_prods = graph.solution.product_stoich_coeffs()
        nu_reacs = graph.solution.reactant_stoich_coeffs()

        self._names = graph.solution.species_names
        self._reactions = graph.solution.reactions()
        self._nu = nu_prods - nu_reacs
        self._nu_dict = {
            s: self._nu[i, :] for i, s in enumerate(self._names)
        }

    def _update_graph(self, den_dict, rates):
        for i, (r, rt) in enumerate(zip(self._reactions, rates)):
            reac = list(r.reactants.keys())
            prod = list(r.products.keys())
            spec = list(set(reac + prod))

            def func(a, b, idx=i, rate=rt):
                return abs(self._nu_dict[a][idx] * rate)

            self._graph.update_edges(reac, spec, func)

            if r.reversible:
                prodonly = [x for x in prod if x not in reac]
                if prodonly:
                    self._graph.update_edges(prodonly, spec, func)

        self._graph.divide_edges(lambda a, b: den_dict[a], verbose=False)

    def _tag_species(self):
        h = nx.DiGraph()

        for spec in self._names:
            h.add_node(spec, mark=False, val=0.0)
            if spec in self._start:
                h.nodes[spec]['mark'] = True
                h.nodes[spec]['val'] = 1.0

        for a, b, prop in self._graph.sort_edges():
            h.add_edge(a, b, val=prop)

            if h.nodes[a]['mark'] and not h.nodes[b]['mark']:
                rab = h.edges[a, b]['val']
                tree = nx.dfs_tree(h, b)

                for node in tree.nodes():
                    if rab > h.nodes[node]['val']:
                        h.nodes[node]['val'] = rab

        sort_species = [(a, h.nodes[a]['val']) for a in h.nodes()]
        return sorted(sort_species, key=lambda p: p[1])

    def get_skeletal_mech(
        self,
        cond_list: Sequence[Any],
        threshold: float
    ) -> list[str]:
        """ Retrieve skeletal mechanism species from sample states.

        Parameters
        ----------
        cond_list : Sequence[Any]
            Condition list (T, P, X, path) representing region.
        threshold : float
            Simplification threshold cutoff.

        Returns
        -------
        list[str]
            Retained species in skeletal mechanism.
        """
        keep_species: list[tuple[str, float]] = []

        for t_val, p_val, _, path in cond_list:
            data = pd.read_csv(Path(path))

            for _, row in data.iterrows():
                comp = {s: row[s] for s in self._names if s in row}
                self._graph.solution.TPX = t_val, p_val, comp
                rates = np.abs(self._graph.solution.net_rates_of_progress)
                den = np.abs(self._nu).dot(rates)
                den_dict = {s: d for s, d in zip(self._names, den)}

                self._graph.reinitialize_graph()
                self._update_graph(den_dict, rates)
                keep_species += self._tag_species()

        keep_dict: dict[str, float] = {}

        for k, v in keep_species:
            if k not in keep_dict:
                keep_dict[k] = v
            else:
                keep_dict[k] = max(v, keep_dict[k])

        retained = [
            k for k, val in keep_dict.items() if val >= threshold
        ]
        return list(set(retained))


class SimplifyDRGManager:
    """ Workflow manager for DRG mechanism simplification. """

    __slots__ = ()

    @staticmethod
    def gen_name_TPXQ(
        mech: str,
        t: float,
        p: float,
        x: Mapping[str, float] | str,
        q: float = 0.0
    ) -> str:
        """ Generate standardized CSV sample file name.

        Parameters
        ----------
        mech : str
            Mechanism identifier name.
        t : float
            Temperature in kelvin.
        p : float
            Pressure in pascal.
        x : Mapping[str, float] | str
            Composition dict or label string.
        q : float = 0.0
            Inlet volume flow rate in SCCM.

        Returns
        -------
        str
            Standardized file name.
        """
        if isinstance(x, dict):
            comp_str = '_'.join(
                f'{k}_{v:.5e}' for k, v in x.items()
            )
        else:
            comp_str = str(x)

        name = f'{mech}_{q:.1f}sccm_{p:.1f}Pa_{t:.2f}K_{comp_str}'
        clean_name = name.replace('.', '_')
        return f'{clean_name}.csv'

    @staticmethod
    def gen_samples_psr(
        mech: Path | str,
        space: StateSpace,
        tend: float,
        overwrite: bool = False,
        **kwargs: object
    ) -> list[list[Any]]:
        """ Generate sample space using an isothermal PSR.

        Parameters
        ----------
        mech : Path | str
            Mechanism file path.
        space : StateSpace
            State space scan conditions.
        tend : float
            Integration end time in seconds.
        overwrite : bool = False
            Allow overwriting existing samples.
        kwargs : object
            Optional configuration arguments.

        Returns
        -------
        list[list[Any]]
            Condition tuples with file paths.
        """
        dir_name = Path(str(kwargs.get('dir_name', 'samples')))
        n_samples = int(kwargs.get('n_samples', 10))
        species = kwargs.get('species', None)
        species_seq = list(species) if species is not None else None
        flowrate = float(kwargs.get('flowrate', 0.0))

        dir_name.mkdir(parents=True, exist_ok=True)
        times = np.linspace(0, tend, n_samples)
        sol = extract_submechanism(mech, species_seq)
        rea = ct.IdealGasReactor(sol, energy='off')
        sim = ct.ReactorNet([rea])

        mech_name = Path(mech).name
        prod_tpx = product(
            space.T or [],
            space.P or [],
            space.X or []
        )
        head = ['T', 'P'] + sol.species_names
        cond_list: list[list[Any]] = []

        for t_val, p_val, x_val in prod_tpx:
            basename = SimplifyDRGManager.gen_name_TPXQ(
                mech_name, t_val, p_val, x_val, q=flowrate
            )
            sample_path = dir_name / basename
            cond_list.append([t_val, p_val, x_val, sample_path])

            if sample_path.exists() and not overwrite:
                continue

            sol.TPX = t_val, p_val, x_val
            rea.syncState()
            sim.set_initial_time(0.0)

            try:
                with sample_path.open('w', newline='', encoding='utf-8') as f:
                    writer = csv.writer(f)
                    writer.writerow(head)
                    writer.writerow([t_val, p_val] + list(sol.X))

                    for step_t in times[1:]:
                        sim.advance(step_t)
                        writer.writerow([t_val, p_val] + list(sol.X))
            except Exception as err:
                warn(f'Error generating {sample_path}: {err}')

        return cond_list

    @staticmethod
    def manage(
        mech: Path | str,
        setup: SimplifySetup,
        overwrite: bool = False,
        **kwargs: object
    ) -> list[Path]:
        """ Manage DRG mechanism simplification workflow.

        Parameters
        ----------
        mech : Path | str
            Mechanism file path.
        setup : SimplifySetup
            Simplification configuration.
        overwrite : bool = False
            Allow overwriting existing outputs.
        kwargs : object
            Additional options.

        Returns
        -------
        list[Path]
            Generated skeletal mechanism species files.
        """
        t0 = time.time()
        setup.validate()
        base_dir = Path(setup.dir_name or 'simplification')
        base_dir.mkdir(parents=True, exist_ok=True)

        call_kwargs = dict(kwargs)
        call_kwargs['species'] = setup.species_filter
        call_kwargs['saveas'] = base_dir / 'graph' / 'analysis'
        call_kwargs['dir_name'] = base_dir / 'samples'

        dir_smp = base_dir / 'smp'
        dir_smp.mkdir(parents=True, exist_ok=True)

        dir_graph = base_dir / 'graph'
        dir_graph.mkdir(parents=True, exist_ok=True)

        if setup.space is None or setup.integ is None:
            raise ValueError('Setup space and integ cannot be None')

        cond_list = SimplifyDRGManager.gen_samples_psr(
            mech,
            setup.space,
            setup.integ,
            overwrite=overwrite,
            **call_kwargs
        )

        graph = analyse_graph(mech, DirectedGraph, **call_kwargs)

        if not isinstance(graph, DirectedGraph):
            raise TypeError('Expected DirectedGraph instance')

        if setup.start_set is None:
            raise ValueError('Setup start_set cannot be None')

        simplifier = SimplifyDRG(graph, setup.start_set)
        tmin = setup.threshold_min or 0.01
        tmax = setup.threshold_max or 0.20
        nsimp = setup.nsimp or 10
        threshold_list = np.linspace(tmin, tmax, nsimp)

        def simplify(threshold):
            smp = simplifier.get_skeletal_mech(cond_list, threshold)
            save_file = dir_smp / f'smp_{threshold:.6f}.txt'
            save_file.write_text(','.join(smp), encoding='utf-8')
            return len(smp)

        respath = dir_smp / 'residual.csv'
        residual_hist: list[list[float]] = [[], []]

        with respath.open('w', newline='', encoding='utf-8') as residuals:
            writer = csv.writer(residuals)

            for threshold in threshold_list:
                nspec = simplify(threshold)
                writer.writerow([threshold, nspec])
                residual_hist[0].append(float(threshold))
                residual_hist[1].append(float(nspec))

        figname = dir_smp / 'residual_hist.png'
        pyplot.close('all')
        fig, ax = pyplot.subplots()
        ax.plot(residual_hist[0], residual_hist[1])
        ax.set_xlabel('Simplification threshold, $\\varepsilon$')
        ax.set_ylabel('Number of residual species')
        pyplot.tight_layout()
        pyplot.savefig(figname, dpi=300)

        return sorted(dir_smp.glob('smp_*'))
