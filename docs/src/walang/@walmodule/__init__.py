from majordome import walang as _

def methodish(self, *args, **kwargs):
    w_info("Methodish called!")
    return f"Won't sum these! Sum = {sum(args)}"

WalType = _.walab_module("WalType", [
        ("methodish",  {}),
        ("dishmethod", {}),
        # ("dishmethod", {}),
    ], module=__name__, call_logging=False, properties={"foo": 37})