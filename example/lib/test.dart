import 'dart:async';
import 'dart:ffi';

import 'dart:io';

import 'dart:isolate';

class Test {
  DynamicLibrary dynamicLibrary;

  void Function(int) _asyncTestInt;
  void Function(Object, int) _testGC;

  Test() {
    dynamicLibrary = Platform.isAndroid ? DynamicLibrary.open("libtest_dl.so") : DynamicLibrary.process();
    _asyncTestInt = dynamicLibrary.lookupFunction<Void Function(Int64), void Function(int)>("async_test_int");
    _testGC = dynamicLibrary.lookupFunction<Void Function(Handle, Int64), void Function(Object, int)>("test_gc");
  }

  Future<int> asyncTestInt() async {
    ReceivePort receivePort = ReceivePort();
    Completer<int> completer = Completer();
    receivePort.listen((message) {
      completer.complete(message);
    });
    _asyncTestInt(receivePort.sendPort.nativePort);
    int res = await completer.future;
    receivePort.close();
    return res;
  }

  void testGC(Object object) async {
    ReceivePort receivePort = ReceivePort();
    Completer<int> completer = Completer();
    receivePort.listen((message) {
      completer.complete(message);
    });
    _testGC(object, receivePort.sendPort.nativePort);
    int res = await completer.future;
    receivePort.close();
  }
}
