//
// Created by 付云天 on 2021/3/12.
//

#ifndef ANDROID_TEST_DL_H
#define ANDROID_TEST_DL_H

#include <dart_api_dl.h>

extern "C" __attribute__((visibility("default"))) __attribute__((used))
void async_test_int(Dart_Port port);

extern "C" __attribute__((visibility("default"))) __attribute__((used))
void test_gc(Dart_Handle object, Dart_Port port);

#endif //ANDROID_TEST_DL_H
