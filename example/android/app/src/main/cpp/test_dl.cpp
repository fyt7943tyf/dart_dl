#include "test_dl.h"
#include <thread>
#include <android/log.h>

void async_test_int(Dart_Port send_port) {
    std::thread t([send_port]() {
        Dart_CObject dart_object;
        dart_object.type = Dart_CObject_kInt64;
        dart_object.value.as_int64 = 114514;
        const bool result = Dart_PostCObject_DL(send_port, &dart_object);
        printf("");
    });
    t.detach();
}

void test_gc(Dart_Handle object, Dart_Port send_port) {
    Dart_WeakPersistentHandle handle1 = Dart_NewWeakPersistentHandle_DL(
            object, reinterpret_cast<void*>(0x1234), 1e9, [](void* isolate_callback_data,
                                                       Dart_WeakPersistentHandle handle,
                                                       void* peer) {
                __android_log_print(ANDROID_LOG_DEBUG, "123", "hello native log");
            });
    assert(handle1 != nullptr);
}