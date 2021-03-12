cmake_minimum_required(VERSION 3.10.2)

project(test_dl)

add_library(libdart_dl SHARED IMPORTED)
set_target_properties(libdart_dl PROPERTIES IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/../../../libs/dart_dl/libs/${ANDROID_ABI}/libdart_dl.so)
include_directories(${CMAKE_SOURCE_DIR}/../../../libs/dart_dl/include)

set(CMAKE_CXX_STANDARD 17)
find_library(log-lib log)

add_library(test_dl SHARED test_dl.cpp)
target_link_libraries(test_dl ${log-lib} libdart_dl)