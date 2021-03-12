cmake_minimum_required(VERSION 3.10.2)

project(dart_dl)

set(CMAKE_C_STANDARD 11)

add_library(dart_dl SHARED dart_api_dl.c)