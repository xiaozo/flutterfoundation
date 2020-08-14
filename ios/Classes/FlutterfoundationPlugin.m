#import "FlutterfoundationPlugin.h"
#import "HttpEncryptTool.h"
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
    } else if ([@"httpRequestEncrypt" isEqualToString:call.method]) {
        NSDictionary *arg = (NSDictionary *)call.arguments;
        NSString *function = arg[@"function"];
        NSString *systemRequesId = arg[@"systemRequesId"];
        NSString *networkRequestAPiKey = arg[@"networkRequestAPiKey"];
        NSString *systemNetworkAesKey = arg[@"systemNetworkAesKey"];
        NSString *userId = arg[@"userId"];
        NSDictionary *inputData = arg[@"inputData"];
        NSDictionary *expand = arg[@"expand"];
        return result([HttpEncryptTool encodingJsonNetworkDataWithFunction:function systemRequesId:systemRequesId networkRequestAPiKey:networkRequestAPiKey systemNetworkAesKey:systemNetworkAesKey userId:userId inputData:inputData expand:expand]);
    }else {
        result(FlutterMethodNotImplemented);
    }
}

@end
