//
//  HttpEncryptTool.h
//  bridge_webview_flutter
//
//  Created by DeerClass on 2020/8/11.
//

#import <Foundation/Foundation.h>

@interface HttpEncryptTool : NSObject

+(NSDictionary*)encodingJsonNetworkDataWithFunction:(NSString*)function
                                     systemRequesId:(NSString *)systemRequesId
                               networkRequestAPiKey:(NSString *)networkRequestAPiKey
                                systemNetworkAesKey:(NSString *)systemNetworkAesKey
                                             userId:(NSString *)userId
                                          inputData:(NSDictionary*)inputData
                                             expand:(NSDictionary*)expand;

@end

