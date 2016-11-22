#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t
from cython.operator cimport dereference as deref
from thrift.lib.py3.thrift_server cimport TException

from collections.abc import Sequence, Set, Mapping
from enum import Enum
cimport py3.module_types





cdef class List__i32:
    def __init__(self, items=None):
        self._vector = make_shared[vector[int32_t]]()
        if items:
            for item in items:
                deref(self._vector).push_back(item)

    @staticmethod
    cdef create(shared_ptr[vector[int32_t]] c_items):
        inst = <List__i32>List__i32.__new__(List__i32)
        inst._vector = c_items
        return inst

    def __getitem__(self, int index):
        cdef int32_t citem = deref(self._vector).at(index)
        return citem

    def __len__(self):
        return deref(self._vector).size()

Sequence.register(List__i32)

cdef class Map__i32_List__i32:
    def __init__(self, items=None):

        self._map = make_shared[cmap[int32_t,vector[int32_t]]]()
        if items:
            for key, item in items.items():
                deref(self._map).insert(cpair[int32_t,vector[int32_t]](key, vector[int32_t](deref(List__i32(item)._vector))))

    @staticmethod
    cdef create(shared_ptr[cmap[int32_t,vector[int32_t]]] c_items):
        inst = <Map__i32_List__i32>Map__i32_List__i32.__new__(Map__i32_List__i32)
        inst._map = c_items
        return inst

    def __getitem__(self, int key):
        cdef int32_t ckey = key
        cdef vector[int32_t] citem = deref(self._map)[ckey]
        return List__i32.create(make_shared[vector[int32_t]](citem))

    def __len__(self):
        return deref(self._map).size()

    def __iter__(self):
        cdef int32_t citem
        for pair in deref(self._map):
            citem = pair.first
            yield citem

Mapping.register(Map__i32_List__i32)

cdef class Set__i32:
    def __init__(self, items=None):
        self._set = make_shared[cset[int32_t]]()
        if items:
            for item in items:
                deref(self._set).insert(item)

    @staticmethod
    cdef create(shared_ptr[cset[int32_t]] c_items):
        inst = <Set__i32>Set__i32.__new__(Set__i32)
        inst._set = c_items
        return inst

    def __contains__(self, int item):
        return pbool(deref(self._set).count(item))

    def __len__(self):
        return deref(self._set).size()

    def __iter__(self):
        for citem in deref(self._set):
            yield citem

Set.register(Set__i32)

cdef class Map__i32_Set__i32:
    def __init__(self, items=None):

        self._map = make_shared[cmap[int32_t,cset[int32_t]]]()
        if items:
            for key, item in items.items():
                deref(self._map).insert(cpair[int32_t,cset[int32_t]](key, cset[int32_t](deref(Set__i32(item)._set))))

    @staticmethod
    cdef create(shared_ptr[cmap[int32_t,cset[int32_t]]] c_items):
        inst = <Map__i32_Set__i32>Map__i32_Set__i32.__new__(Map__i32_Set__i32)
        inst._map = c_items
        return inst

    def __getitem__(self, int key):
        cdef int32_t ckey = key
        cdef cset[int32_t] citem = deref(self._map)[ckey]
        return Set__i32.create(make_shared[cset[int32_t]](citem))

    def __len__(self):
        return deref(self._map).size()

    def __iter__(self):
        cdef int32_t citem
        for pair in deref(self._map):
            citem = pair.first
            yield citem

Mapping.register(Map__i32_Set__i32)

cdef class Map__i32_i32:
    def __init__(self, items=None):

        self._map = make_shared[cmap[int32_t,int32_t]]()
        if items:
            for key, item in items.items():
                deref(self._map).insert(cpair[int32_t,int32_t](key, item))

    @staticmethod
    cdef create(shared_ptr[cmap[int32_t,int32_t]] c_items):
        inst = <Map__i32_i32>Map__i32_i32.__new__(Map__i32_i32)
        inst._map = c_items
        return inst

    def __getitem__(self, int key):
        cdef int32_t ckey = key
        cdef int32_t citem = deref(self._map)[ckey]
        return citem

    def __len__(self):
        return deref(self._map).size()

    def __iter__(self):
        cdef int32_t citem
        for pair in deref(self._map):
            citem = pair.first
            yield citem

Mapping.register(Map__i32_i32)

cdef class List__Map__i32_i32:
    def __init__(self, items=None):
        self._vector = make_shared[vector[cmap[int32_t,int32_t]]]()
        if items:
            for item in items:
                deref(self._vector).push_back(cmap[int32_t,int32_t](deref(Map__i32_i32(item)._map)))

    @staticmethod
    cdef create(shared_ptr[vector[cmap[int32_t,int32_t]]] c_items):
        inst = <List__Map__i32_i32>List__Map__i32_i32.__new__(List__Map__i32_i32)
        inst._vector = c_items
        return inst

    def __getitem__(self, int index):
        cdef cmap[int32_t,int32_t] citem = deref(self._vector).at(index)
        return Map__i32_i32.create(make_shared[cmap[int32_t,int32_t]](citem))

    def __len__(self):
        return deref(self._vector).size()

Sequence.register(List__Map__i32_i32)

cdef class List__Set__i32:
    def __init__(self, items=None):
        self._vector = make_shared[vector[cset[int32_t]]]()
        if items:
            for item in items:
                deref(self._vector).push_back(cset[int32_t](deref(Set__i32(item)._set)))

    @staticmethod
    cdef create(shared_ptr[vector[cset[int32_t]]] c_items):
        inst = <List__Set__i32>List__Set__i32.__new__(List__Set__i32)
        inst._vector = c_items
        return inst

    def __getitem__(self, int index):
        cdef cset[int32_t] citem = deref(self._vector).at(index)
        return Set__i32.create(make_shared[cset[int32_t]](citem))

    def __len__(self):
        return deref(self._vector).size()

Sequence.register(List__Set__i32)

cdef class Map__i32_Map__i32_Set__i32:
    def __init__(self, items=None):

        self._map = make_shared[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]()
        if items:
            for key, item in items.items():
                deref(self._map).insert(cpair[int32_t,cmap[int32_t,cset[int32_t]]](key, cmap[int32_t,cset[int32_t]](deref(Map__i32_Set__i32(item)._map))))

    @staticmethod
    cdef create(shared_ptr[cmap[int32_t,cmap[int32_t,cset[int32_t]]]] c_items):
        inst = <Map__i32_Map__i32_Set__i32>Map__i32_Map__i32_Set__i32.__new__(Map__i32_Map__i32_Set__i32)
        inst._map = c_items
        return inst

    def __getitem__(self, int key):
        cdef int32_t ckey = key
        cdef cmap[int32_t,cset[int32_t]] citem = deref(self._map)[ckey]
        return Map__i32_Set__i32.create(make_shared[cmap[int32_t,cset[int32_t]]](citem))

    def __len__(self):
        return deref(self._map).size()

    def __iter__(self):
        cdef int32_t citem
        for pair in deref(self._map):
            citem = pair.first
            yield citem

Mapping.register(Map__i32_Map__i32_Set__i32)

cdef class List__Map__i32_Map__i32_Set__i32:
    def __init__(self, items=None):
        self._vector = make_shared[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]]()
        if items:
            for item in items:
                deref(self._vector).push_back(cmap[int32_t,cmap[int32_t,cset[int32_t]]](deref(Map__i32_Map__i32_Set__i32(item)._map)))

    @staticmethod
    cdef create(shared_ptr[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]] c_items):
        inst = <List__Map__i32_Map__i32_Set__i32>List__Map__i32_Map__i32_Set__i32.__new__(List__Map__i32_Map__i32_Set__i32)
        inst._vector = c_items
        return inst

    def __getitem__(self, int index):
        cdef cmap[int32_t,cmap[int32_t,cset[int32_t]]] citem = deref(self._vector).at(index)
        return Map__i32_Map__i32_Set__i32.create(make_shared[cmap[int32_t,cmap[int32_t,cset[int32_t]]]](citem))

    def __len__(self):
        return deref(self._vector).size()

Sequence.register(List__Map__i32_Map__i32_Set__i32)

cdef class List__List__Map__i32_Map__i32_Set__i32:
    def __init__(self, items=None):
        self._vector = make_shared[vector[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]]]()
        if items:
            for item in items:
                deref(self._vector).push_back(vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]](deref(List__Map__i32_Map__i32_Set__i32(item)._vector)))

    @staticmethod
    cdef create(shared_ptr[vector[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]]] c_items):
        inst = <List__List__Map__i32_Map__i32_Set__i32>List__List__Map__i32_Map__i32_Set__i32.__new__(List__List__Map__i32_Map__i32_Set__i32)
        inst._vector = c_items
        return inst

    def __getitem__(self, int index):
        cdef vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]] citem = deref(self._vector).at(index)
        return List__Map__i32_Map__i32_Set__i32.create(make_shared[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]](citem))

    def __len__(self):
        return deref(self._vector).size()

Sequence.register(List__List__Map__i32_Map__i32_Set__i32)


