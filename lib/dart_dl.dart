import 'dart:ffi';
import 'dart:io';

class DartDl {
  static void init() {
    DynamicLibrary dynamicLibrary = Platform.isAndroid ? DynamicLibrary.open("libdart_dl.so") : DynamicLibrary.process();
    int Function(Pointer<Void>) dartInitDl = dynamicLibrary.lookupFunction<Int32 Function(Pointer<Void>), int Function(Pointer<Void>)>("Dart_InitializeApiDL");
    int res = dartInitDl(NativeApi.initializeApiDLData);
    assert(res == 0);
  }
}
