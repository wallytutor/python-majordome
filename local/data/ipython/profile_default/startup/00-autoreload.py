from IPython import get_ipython

ipython = get_ipython()

print("\n\033[32mKOMPANION IPYTHON\033[0m")

if ipython is not None:
    ipython.run_line_magic("load_ext", "autoreload")
    ipython.run_line_magic("autoreload", "2")
    print("\033[34m- Autoreload enabled (mode 2)\033[0m")

import majordome as mj
print("\033[34m- Imported majordome as mj\033[0m")