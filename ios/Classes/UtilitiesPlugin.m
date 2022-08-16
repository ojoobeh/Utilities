#import "UtilitiesPlugin.h"
#if __has_include(<utilities/utilities-Swift.h>)
#import <utilities/utilities-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "utilities-Swift.h"
#endif

@implementation UtilitiesPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftUtilitiesPlugin registerWithRegistrar:registrar];
}
@end
