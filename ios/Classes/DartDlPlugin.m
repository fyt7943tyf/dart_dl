#import "DartDlPlugin.h"
#if __has_include(<dart_dl/dart_dl-Swift.h>)
#import <dart_dl/dart_dl-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dart_dl-Swift.h"
#endif

@implementation DartDlPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDartDlPlugin registerWithRegistrar:registrar];
}
@end
