#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.string cimport string
from libcpp cimport bool as cbool
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t
from libcpp.memory cimport shared_ptr, unique_ptr
from libcpp.vector cimport vector
from libcpp.set cimport set as cset
from libcpp.map cimport map as cmap, pair as cpair
from thrift.lib.py3.thrift_server cimport cTException, TException


cdef extern from "src/gen-cpp2/module_types.h" namespace "py3::simple":
    cdef cppclass cAnEnum "py3::simple::AnEnum":
        bint operator==(cAnEnum&)
    cAnEnum AnEnum__ONE "py3::simple::AnEnum::ONE"
    cAnEnum AnEnum__TWO "py3::simple::AnEnum::TWO"
    cAnEnum AnEnum__THREE "py3::simple::AnEnum::THREE"
    cAnEnum AnEnum__FOUR "py3::simple::AnEnum::FOUR"

cdef cAnEnum AnEnum_to_cpp(value)

cdef extern from "src/gen-cpp2/module_types.h" namespace "py3::simple":
    cdef cppclass cSimpleException "py3::simple::SimpleException"(cTException):
        cSimpleException() except +
        int16_t err_code

    cdef cppclass cSimpleStruct "py3::simple::SimpleStruct":
        cSimpleStruct() except +
        cbool is_on
        int8_t tiny_int
        int16_t small_int
        int32_t nice_sized_int
        int64_t big_int
        double real

    cdef cppclass cComplexStruct "py3::simple::ComplexStruct":
        cComplexStruct() except +
        cSimpleStruct structOne
        cSimpleStruct structTwo
        int32_t an_integer
        string name
        cAnEnum an_enum


cdef extern from "<utility>" namespace "std" nogil:
    cdef shared_ptr[cSimpleException] move(unique_ptr[cSimpleException])
    cdef shared_ptr[cSimpleStruct] move(unique_ptr[cSimpleStruct])
    cdef shared_ptr[cComplexStruct] move(unique_ptr[cComplexStruct])

cdef class SimpleException(TException):
    cdef shared_ptr[cSimpleException] c_SimpleException

    @staticmethod
    cdef create(shared_ptr[cSimpleException] c_SimpleException)

cdef class SimpleStruct:
    cdef shared_ptr[cSimpleStruct] c_SimpleStruct

    @staticmethod
    cdef create(shared_ptr[cSimpleStruct] c_SimpleStruct)

cdef class ComplexStruct:
    cdef shared_ptr[cComplexStruct] c_ComplexStruct
    cdef SimpleStruct __structOne
    cdef SimpleStruct __structTwo

    @staticmethod
    cdef create(shared_ptr[cComplexStruct] c_ComplexStruct)


cdef class List__i16:
    cdef shared_ptr[vector[int16_t]] _vector
    @staticmethod
    cdef create(shared_ptr[vector[int16_t]])

cdef class List__i32:
    cdef shared_ptr[vector[int32_t]] _vector
    @staticmethod
    cdef create(shared_ptr[vector[int32_t]])

cdef class List__i64:
    cdef shared_ptr[vector[int64_t]] _vector
    @staticmethod
    cdef create(shared_ptr[vector[int64_t]])

cdef class List__string:
    cdef shared_ptr[vector[string]] _vector
    @staticmethod
    cdef create(shared_ptr[vector[string]])

cdef class List__SimpleStruct:
    cdef shared_ptr[vector[cSimpleStruct]] _vector
    @staticmethod
    cdef create(shared_ptr[vector[cSimpleStruct]])

cdef class Set__i32:
    cdef shared_ptr[cset[int32_t]] _set
    @staticmethod
    cdef create(shared_ptr[cset[int32_t]])

cdef class Set__string:
    cdef shared_ptr[cset[string]] _set
    @staticmethod
    cdef create(shared_ptr[cset[string]])

cdef class Map__string_string:
    cdef shared_ptr[cmap[string,string]] _map
    @staticmethod
    cdef create(shared_ptr[cmap[string,string]])

cdef class Map__string_SimpleStruct:
    cdef shared_ptr[cmap[string,cSimpleStruct]] _map
    @staticmethod
    cdef create(shared_ptr[cmap[string,cSimpleStruct]])

cdef class Map__string_i16:
    cdef shared_ptr[cmap[string,int16_t]] _map
    @staticmethod
    cdef create(shared_ptr[cmap[string,int16_t]])

cdef class List__List__i32:
    cdef shared_ptr[vector[vector[int32_t]]] _vector
    @staticmethod
    cdef create(shared_ptr[vector[vector[int32_t]]])

cdef class Map__string_i32:
    cdef shared_ptr[cmap[string,int32_t]] _map
    @staticmethod
    cdef create(shared_ptr[cmap[string,int32_t]])

cdef class Map__string_Map__string_i32:
    cdef shared_ptr[cmap[string,cmap[string,int32_t]]] _map
    @staticmethod
    cdef create(shared_ptr[cmap[string,cmap[string,int32_t]]])

cdef class List__Set__string:
    cdef shared_ptr[vector[cset[string]]] _vector
    @staticmethod
    cdef create(shared_ptr[vector[cset[string]]])

cdef class Map__string_List__SimpleStruct:
    cdef shared_ptr[cmap[string,vector[cSimpleStruct]]] _map
    @staticmethod
    cdef create(shared_ptr[cmap[string,vector[cSimpleStruct]]])

cdef class List__List__string:
    cdef shared_ptr[vector[vector[string]]] _vector
    @staticmethod
    cdef create(shared_ptr[vector[vector[string]]])

cdef class List__Set__i32:
    cdef shared_ptr[vector[cset[int32_t]]] _vector
    @staticmethod
    cdef create(shared_ptr[vector[cset[int32_t]]])

cdef class List__Map__string_string:
    cdef shared_ptr[vector[cmap[string,string]]] _vector
    @staticmethod
    cdef create(shared_ptr[vector[cmap[string,string]]])

cdef extern from "<utility>" namespace "std" nogil:
    cdef shared_ptr[vector[int16_t]] move(unique_ptr[vector[int16_t]])
    cdef shared_ptr[vector[int32_t]] move(unique_ptr[vector[int32_t]])
    cdef shared_ptr[vector[int64_t]] move(unique_ptr[vector[int64_t]])
    cdef shared_ptr[vector[string]] move(unique_ptr[vector[string]])
    cdef shared_ptr[vector[cSimpleStruct]] move(unique_ptr[vector[cSimpleStruct]])
    cdef shared_ptr[cset[int32_t]] move(unique_ptr[cset[int32_t]])
    cdef shared_ptr[cset[string]] move(unique_ptr[cset[string]])
    cdef shared_ptr[cmap[string,string]] move(unique_ptr[cmap[string,string]])
    cdef shared_ptr[cmap[string,cSimpleStruct]] move(unique_ptr[cmap[string,cSimpleStruct]])
    cdef shared_ptr[cmap[string,int16_t]] move(unique_ptr[cmap[string,int16_t]])
    cdef shared_ptr[vector[vector[int32_t]]] move(unique_ptr[vector[vector[int32_t]]])
    cdef shared_ptr[cmap[string,int32_t]] move(unique_ptr[cmap[string,int32_t]])
    cdef shared_ptr[cmap[string,cmap[string,int32_t]]] move(unique_ptr[cmap[string,cmap[string,int32_t]]])
    cdef shared_ptr[vector[cset[string]]] move(unique_ptr[vector[cset[string]]])
    cdef shared_ptr[cmap[string,vector[cSimpleStruct]]] move(unique_ptr[cmap[string,vector[cSimpleStruct]]])
    cdef shared_ptr[vector[vector[string]]] move(unique_ptr[vector[vector[string]]])
    cdef shared_ptr[vector[cset[int32_t]]] move(unique_ptr[vector[cset[int32_t]]])
    cdef shared_ptr[vector[cmap[string,string]]] move(unique_ptr[vector[cmap[string,string]]])

cdef extern from "src/gen-cpp2/module_constants.h" namespace "py3::simple":
    cdef cbool cA_BOOL "py3::simple::module_constants::A_BOOL"
    cdef int8_t cA_BYTE "py3::simple::module_constants::A_BYTE"
    cdef int16_t cTHE_ANSWER "py3::simple::module_constants::THE_ANSWER"
    cdef int32_t cA_NUMBER "py3::simple::module_constants::A_NUMBER"
    cdef int64_t cA_BIG_NUMBER "py3::simple::module_constants::A_BIG_NUMBER"
    cdef double cA_REAL_NUMBER "py3::simple::module_constants::A_REAL_NUMBER"
    cdef double cA_FAKE_NUMBER "py3::simple::module_constants::A_FAKE_NUMBER"
    cdef const char* cA_WORD "py3::simple::module_constants::A_WORD"()
    cdef cSimpleStruct cA_STRUCT "py3::simple::module_constants::A_STRUCT"()
    cdef vector[string] cWORD_LIST "py3::simple::module_constants::WORD_LIST"()
    cdef cset[int32_t] cDIGITS "py3::simple::module_constants::DIGITS"()
    cdef cmap[string,cSimpleStruct] cA_CONST_MAP "py3::simple::module_constants::A_CONST_MAP"()
