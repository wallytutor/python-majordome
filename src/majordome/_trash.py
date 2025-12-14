class classproperty(property):
    """ Extend Python to support class properties.

    Note: this class does not reproduce the full behavior of `property`
    because accessing `fget` will return the computed value and thus it
    is not possible to recover directly the docstring of the attribute.
    A proxy object would be required, but then things would slow down,
    what is undesirable. You can retrieve the actual docstring through
    `cls.__dict__[name].fget.__wrapped__.__doc__` in a class, where the
    value of `name` is the attribute being accessed.
    """
    def __init__(self, fget=None, fset=None, fdel=None, doc=None):
        fget = fget if fget is None else wraps(fget)(fget)
        fset = fset if fset is None else wraps(fset)(fset)
        fdel = fdel if fdel is None else wraps(fdel)(fdel)
        super().__init__(fget, fset, fdel, doc or fget.__doc__)

    def __get__(self, obj, objtype=None):
        # Instead of binding to instance, bind to class
        return self.fget(objtype)

    def __set__(self, obj, value):
        if self.fset is None:
            raise AttributeError("can't set attribute")
        return self.fset(type(obj), value)

    def __delete__(self, obj):
        if self.fdel is None:
            raise AttributeError("can't delete attribute")
        return self.fdel(type(obj))

    def __getattribute__(self, name):
        if name == "__doc__":
            return super().__getattribute__("fget").__doc__
        return super().__getattribute__(name)


class Singleton:
    """ Create a class with a single instance. """
    _instance = None

    def __new__(cls, *args, **kwargs):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance


class Constants(Singleton):
    """ Singleton class with constant properties. """
    @classproperty
    def GRAVITY(cls) -> float:
        """ Conventional gravity acceleration on Earth [m/s²]. """
        return 9.80665

    @classproperty
    def T_REFERENCE(cls) -> float:
        """ Thermodynamic reference temperature [K]. """
        return 298.15

    @classproperty
    def T_NORMAL(cls) -> float:
        """ Normal state reference temperature [K]. """
        return 273.15

    @classproperty
    def P_NORMAL(cls) -> float:
        """ Normal state reference pressure [Pa]. """
        return 101325.0

    @classmethod
    def _entry(cls, name):
        """ Generate an entry for report table. """
        doc = cls.__dict__[name].fget.__wrapped__.__doc__
        val = getattr(cls, name)

        if (matched := re.match(r'^(.*?)\s*\[([^\]]+)\]', doc)):
            text, unit = matched.groups()
            return name, text.strip(), unit, val

        return name, doc, "", val

    @classmethod
    def report(cls) -> str:
        """ Tabulates all constants in a readable manner. """
        data = [cls._entry("GRAVITY"), cls._entry("T_REFERENCE"),
                cls._entry("T_NORMAL"), cls._entry("P_NORMAL")]
        return tabulate(data, tablefmt="github")


# WIP: eliminating this module level constants.
GRAVITY = Constants.GRAVITY
""" Conventional gravitational acceleration on Earth [m/s²]. """

T_REFERENCE = Constants.T_REFERENCE
""" Thermodynamic reference temperature [K]. """

T_NORMAL = Constants.T_NORMAL
""" Normal state reference temperature [K]. """

P_NORMAL = Constants.P_NORMAL
""" Normal state reference pressure [Pa]. """
