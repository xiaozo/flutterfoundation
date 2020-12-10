#import "FlutterfoundationPlugin.h"
#import <Flutter/Flutter.h>

@implementation FlutterfoundationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutterfoundation"
            binaryMessenger:[registrar messenger]];
  FlutterfoundationPlugin* instance = [[FlutterfoundationPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else if ([@"getNativeImage" isEqualToString:call.method]) {
        NSDictionary *arg = (NSDictionary *)call.arguments;
        NSString *imageName = arg[@"imageName"] ? : @"";
        NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:imageName]);
        return result(imageData.length ? imageData : nil);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
