from majordome import walang as _

WalType = _.walab_import("@walmodule", "WalType")
waltype = _.walab_instance("@walmodule", "WalType")

print(f"WalType.foo = {WalType.foo} is 37?")
print(f"waltype.foo = {waltype.foo} is 37?")

print(f"waltype.methodish(3, 4) = {waltype.methodish(3, 4)} is 7?")
print(f"waltype.dishmethod(3, 4) = {waltype.dishmethod(3, 4)}")
