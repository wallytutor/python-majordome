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

from functools import wraps, update_wrapper
from majordome.parsing import FuncArguments
# import majordome.walang

# ## Illustrating `FuncArguments`

def f(*args, **kwargs):
    """ Arbitrary interface function for illustration. """
    f.parser.update(*args, **kwargs)

    try:
        print(f"a = {f.parser.get("a")}, b = {f.parser.get("b")}")
        f.parser.close()
    except Exception as err:
        print(err)
        pass


# - Arguments are both positional-mandatory

# +
f.parser = FuncArguments()
f.parser.add("a", index=0)
f.parser.add("b", index=1)

f(3)
f(3, 4)
# -

# - Arguments are both keyword-only

# +
f.parser = FuncArguments()
f.parser.add("a", default="aaaa")
f.parser.add("b", default="bbbb")

f(3)
f(3, 4)
f(3, b=4)
f(a=3, b=4)
# -

# - One positional and another (maybe) positional

# +
f.parser = FuncArguments()
f.parser.add("a", index=0)
f.parser.add("b", index=1, default=6)

f(3)
f(3, 4)
f(3, 4, b=4)
# -

# - Badly configured

# +
f.parser = FuncArguments()

try:
    f.parser.add("a")
    f.parser.add("b")
except Exception as err:
    print(err)


# -

# ## Creating class constructors

def _init_some_class(cls):
    """ Decorator to enhance SomeClass with argument parsing. """
    orig_init = cls.__init__

    parser = FuncArguments(greedy_args=False, pop_kw=True)
    parser.add("a", 0)
    parser.add("x", default=None)

    @wraps(orig_init)
    def new_init(self, *args, **kwargs):
        parser.update(*args, **kwargs)
        a = parser.get("a")
        x = parser.get("x")

        orig_init(self, *parser.args, **parser.kwargs)
        parser.close()

        # -- logic goes here
        print(f"some a = {a}")
        print(f"some x = {x}")

        return None

    cls.__init__ = update_wrapper(new_init, orig_init)
    return cls


class BaseClass:
    def __init__(self, *args, **kwargs) -> None:
        print(f"args   = {args}")
        print(f"kwargs = {kwargs}")


@_init_some_class
class SomeClass(BaseClass):
    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)


some = SomeClass(1, 2, 3, x=1, y=2)
