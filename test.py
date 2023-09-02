from typing import Type


class A:
    pass


def init_subclass(cls: Type, /, **kwargs) -> None:
    pass


A.__init_subclass__ = classmethod(init_subclass)
