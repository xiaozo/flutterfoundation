//
//  HttpEncryptTool.m
//  bridge_webview_flutter
//
//  Created by DeerClass on 2020/8/11.
//

#import "HttpEncryptTool.h"
#import "PublicRequestDefine.h"
#import "OpenUDID.h"
#import "NSString+ZLKExtend.h"
#import "AESCbc.h"

@implementation HttpEncryptTool

+(NSDictionary*)encodingJsonNetworkDataWithFunction:(NSString*)function
                                     systemRequesId:(NSString *)systemRequesId
                               networkRequestAPiKey:(NSString *)networkRequestAPiKey
                                systemNetworkAesKey:(NSString *)systemNetworkAesKey
                                             userId:(NSString *)userId
                                          inputData:(NSDictionary*)inputData
                                             expand:(NSDictionary*)expand {
    
    NSString *timestamp = [NSString stringWithFormat:@"%d", (int)[[NSDate date] timeIntervalSince1970]];
    if (inputData == nil) {
        inputData = [NSMutableDictionary dictionary];
    } else {
        inputData=[NSMutableDictionary dictionaryWithDictionary:inputData];
    }
    
    if(expand==nil)
        expand=[NSMutableDictionary dictionary];
    else
        expand=[NSMutableDictionary dictionaryWithDictionary:expand];
    
    
    NSString* apiVersion=@"10000";
    NSString *random=[[[NSString generateGUID] stringByReplacingOccurrencesOfString:@"-" withString:@""] lowercaseString];;
    
    NSString* uniqueData=[self userId:userId systemRequesId:systemRequesId uniqueData:timestamp random:random];
    NSMutableDictionary *encryptBody=[NSMutableDictionary dictionary];
    [encryptBody setObject:function forKey:@"function"];
    [encryptBody setObject:uniqueData forKey:@"unique_data"];
    [encryptBody setObject:apiVersion forKey:@"api_version"];
    [encryptBody setObject:@"" forKey:@"token"];
    [encryptBody setObject:inputData forKey:@"input_data"];
    
    
    NSError *error;
    //    NSString *encryptBodyJsonString=[encryptBody JSONStringWithOptions:JKSerializeOptionNone error:&error] ;
    NSData *encryptBodyJsonData= [NSJSONSerialization dataWithJSONObject:encryptBody options:NSJSONWritingPrettyPrinted error:&error];
    NSString *encryptBodyJsonString = [[NSString alloc] initWithData:encryptBodyJsonData encoding:NSUTF8StringEncoding];
    NSString *key=systemNetworkAesKey.md5_32Lower;
    NSString *newKey=[key substringWithRange:NSMakeRange(0,16)];
    NSString *iv=[key substringWithRange:NSMakeRange(16,16)];
    
    NSString *encryptBodyEncrypt=[NSData encrypt:encryptBodyJsonString key:newKey iv:iv];
    NSString *expandJsonString=@"{}";
    if(expand!=nil&&expand.allKeys.count>0)
    {
        //        expandJsonString= [expand JSONStringWithOptions:JKSerializeOptionNone error:nil] ;
        NSData *expandJsonData= [NSJSONSerialization dataWithJSONObject:expand options:NSJSONWritingPrettyPrinted error:nil];
        expandJsonString = [[NSString alloc] initWithData:expandJsonData encoding:NSUTF8StringEncoding];
    }
    
    //    NSLog(@"<==========Request Json Dara============>:%@\n%@\n=================================>",encryptBodyJsonString,expandJsonString);
    NSMutableString *uniqKeyStr=[NSMutableString stringWithFormat:@"%@&%@&%@",encryptBodyEncrypt,expandJsonString,networkRequestAPiKey];
    NSArray *base36CodeArray=[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z", nil];
    NSString *base36Code=@"";
    for(int x=0;x<15;x++){
        base36Code=[base36Code stringByAppendingString:base36CodeArray[arc4random_uniform(36)]];
    }
    uniqKeyStr= [NSMutableString stringWithString: uniqKeyStr.md5_32Lower] ;
    [uniqKeyStr insertString:[base36Code substringWithRange:NSMakeRange(0,5)] atIndex:10];
    [uniqKeyStr insertString:[base36Code substringWithRange:NSMakeRange(5,5)] atIndex:25];
    [uniqKeyStr insertString:[base36Code substringWithRange:NSMakeRange(10,5)] atIndex:40];
    NSMutableDictionary *body=[NSMutableDictionary dictionaryWithObjectsAndKeys:
                               encryptBodyEncrypt,
                               @"encrypt",
                               expandJsonString,
                               @"expand",
                               uniqKeyStr,
                               @"sign",
                               nil];
    
    return body;
    
}


+(NSString *)userId:(NSString *)userId systemRequesId:(NSString *)systemRequesId uniqueData:(NSString*)timestamp random:(NSString*)random //返回数据串
{
    
    NSString * version = APP_SYSTEM_APP_VERSIONSTRING;
    NSArray *array =  [version componentsSeparatedByString:@"."];
    NSInteger count = 0;
    for (int i=0; i<array.count; i++) {
        count += [array[i] intValue] *  powf(100,array.count-i-1);
    }
    version =  [NSString stringWithFormat:@"%ld",(long)count];
    
    return [NSString stringWithFormat:@"%@|%@|%@|%@|%@|%@",
            userId.length>0?userId:@"0" ,//用户编号
            version,   //应用版本
            timestamp,       //时间戳
            [self openUDID],     //设备码
            systemRequesId,
            random];     //系统编号
}

//获取设备ID
+(NSString*)openUDID
{
    NSString *UDIDValue=[[OpenUDID value]stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return UDIDValue;
}

@end
