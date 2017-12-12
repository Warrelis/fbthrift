#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from libcpp.iterator cimport inserter as cinserter
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t, uint32_t
from cython.operator cimport dereference as deref, preincrement as inc
import thrift.py3.types
cimport thrift.py3.types
cimport thrift.py3.exceptions
from thrift.py3.types import NOTSET as __NOTSET
from thrift.py3.types cimport translate_cpp_enum_to_python
cimport thrift.py3.std_libcpp as std_libcpp
from thrift.py3.serializer cimport IOBuf
from thrift.py3.serializer import Protocol
cimport thrift.py3.serializer as serializer
from thrift.py3.serializer import deserialize, serialize
from folly.optional cimport cOptional

import sys
import itertools
from collections import Sequence, Set, Mapping, Iterable
from enum import Enum
import warnings
import builtins as _builtins




cdef class std_unordered_map__Map__i32_string:
    def __init__(self, items=None):
        if isinstance(items, std_unordered_map__Map__i32_string):
            self._cpp_obj = (<std_unordered_map__Map__i32_string> items)._cpp_obj
        else:
            self._cpp_obj = move(std_unordered_map__Map__i32_string._make_instance(items))

    @staticmethod
    cdef create(shared_ptr[std_unordered_map[int32_t,string]] c_items):
        inst = <std_unordered_map__Map__i32_string>std_unordered_map__Map__i32_string.__new__(std_unordered_map__Map__i32_string)
        inst._cpp_obj = c_items
        return inst

    @staticmethod
    cdef unique_ptr[std_unordered_map[int32_t,string]] _make_instance(object items) except *:
        cdef unique_ptr[std_unordered_map[int32_t,string]] c_inst = make_unique[std_unordered_map[int32_t,string]]()
        if items is not None:
            for key, item in items.items():
                if not isinstance(item, str):
                    raise TypeError(f"{item!r} is not of type str")

                deref(c_inst).insert(cpair[int32_t,string](key,item.encode('UTF-8')))
        return move_unique(c_inst)

    def __getitem__(self, key):
        if not self:
            raise KeyError(f'{key}')
        cdef int32_t ckey = key
        cdef std_unordered_map[int32_t,string].iterator iter = deref(
            self._cpp_obj).find(ckey)
        if iter == deref(self._cpp_obj).end():
            raise KeyError(f'{key}')
        cdef string citem = deref(iter).second
        return bytes(citem).decode('UTF-8')

    def __len__(self):
        return deref(self._cpp_obj).size()

    def __iter__(self):
        if not self:
            raise StopIteration
        cdef int32_t citem
        for pair in deref(self._cpp_obj):
            citem = pair.first
            yield citem

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Mapping) and isinstance(other, Mapping)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for key in self:
            if key not in other:
                return cop != 2
            if other[key] != self[key]:
                return cop != 2

        return cop == 2

    def __hash__(self):
        if not self.__hash:
            self.__hash = hash(tuple(self.items()))
        return self.__hash

    def __repr__(self):
        if not self:
            return 'i{}'
        return f'i{{{", ".join(map(lambda i: f"{repr(i[0])}: {repr(i[1])}", self.items()))}}}'



    def __contains__(self, key):
        cdef int32_t ckey = key
        return deref(self._cpp_obj).count(ckey) > 0

    def get(self, key, default=None):
        if not self:
            return default
        cdef int32_t ckey = key
        cdef std_unordered_map[int32_t,string].iterator iter = \
            deref(self._cpp_obj).find(ckey)
        if iter == deref(self._cpp_obj).end():
            return default
        cdef string citem = deref(iter).second
        return bytes(citem).decode('UTF-8')

    def keys(self):
        return self.__iter__()

    def values(self):
        if not self:
            raise StopIteration
        cdef string citem
        for pair in deref(self._cpp_obj):
            citem = pair.second
            yield bytes(citem).decode('UTF-8')

    def items(self):
        if not self:
            raise StopIteration
        cdef int32_t ckey
        cdef string citem
        for pair in deref(self._cpp_obj):
            ckey = pair.first
            citem = pair.second

            yield (ckey, bytes(citem).decode('UTF-8'))



Mapping.register(std_unordered_map__Map__i32_string)

SomeMap = std_unordered_map__Map__i32_string
