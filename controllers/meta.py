from controllers import _test_classes

class TestMeta(type):
    """
    Metaclass for all Test classes
    registers the class by name, unless otherwise specified
    """
    def __init__(self, *args, **kwargs):
        # need to hide kwargs from type.__init__
        super(TestMeta, self).__init__(*args)

    def __new__(cls, name, bases, attrs, register=True):
        # initialize class as normal
        outclass = type.__new__(cls, name, bases, attrs)

        if register:
            # register the class by name
            reg_name = outclass.name or '%s.%s' % (outclass.__module__, name)
            _test_classes[reg_name] = outclass

        return outclass
