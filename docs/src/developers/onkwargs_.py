# ---
# jupyter:
#   jupytext:
#     cell_metadata_filter: -all
#     text_representation:
#       extension: .py
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.17.3
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# # A note on `**kwargs` parsing

# %load_ext autoreload
# %autoreload 2

from majordome.parsing import FuncArguments
import majordome.walang


def f(*args, **kwargs):
    """ Arbitrary interface function for illustration. """
    f.parser.update(*args, **kwargs)

    try:
        print(f"a = {f.parser.get("a")}, b = {f.parser.get("b")}")
        f.parser.close()
    except Exception as err:
        print(err)
        pass



# ## Both positional-mandatory

# +
f.parser = FuncArguments()
f.parser.add("a", index=0)
f.parser.add("b", index=1)

f(3)
f(3, 4)
# -

# ## Both keyword-only

# +
f.parser = FuncArguments()
f.parser.add("a", default="aaaa")
f.parser.add("b", default="bbbb")

f(3)
f(3, 4)
f(3, b=4)
f(a=3, b=4)
# -

# ## One positional and another maybe positional

# +
f.parser = FuncArguments()
f.parser.add("a", index=0)
f.parser.add("b", index=1, default=6)

f(3)
f(3, 4)
f(3, 4, b=4)
# -

# ## Badly configured

# +
f.parser = FuncArguments()

try:
    f.parser.add("a")
    f.parser.add("b")
except Exception as err:
    print(err)
