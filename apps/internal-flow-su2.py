# -*- coding: utf-8 -*-
"""
Gradio UI for Internal Flow SU2 App
-----------------------------------

For interactive development, run the demo with the following:

> gradio src/majordome-apps/internal-flow-su2.py --watch-library
"""

import gradio as gr


def create_ui():
    with gr.Blocks() as demo:
        gr.Markdown("## Internal Flow SU2 App")

    return demo


if __name__ == "__main__":
    demo = create_ui()
    demo.launch(
        theme       = gr.themes.Soft(),
        server_name = "0.0.0.0",
        server_port = 7000,
        share       = False
    )
