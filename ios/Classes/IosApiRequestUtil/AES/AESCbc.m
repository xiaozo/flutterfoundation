//
//  AESCbc.m
//  MagicBabyAppClient
//
//  Created by 庄小先生丶 on 15/7/6.
//  Copyright (c) 2015年 庄小先生丶. All rights reserved.
//

#import "AESCbc.h"
#import "CommonCrypto/CommonCrypto.h"
#import "AESCbc.h"
#import "NSData+base64Encoding.h"

@implementation NSData(AES128CBC)

+(NSString*)encrypt:(NSString*)code key:(NSString *)key iv:(NSString *)iv
{
    NSData *data = [code dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encrypt = [NSData AES128EncryptWithKey:key withData:data iv:iv];
    return [encrypt base64EncodingWithSafeUrl];

    
}

+ (NSData *)AES128EncryptWithKey:(NSString *)key withData:(NSData*)_data iv:(NSString *) iv
{
    char keyPtr[kCCKeySizeAES128 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof( keyPtr ) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCBlockSizeAES128 + 1];
    memset(ivPtr, 0, sizeof(ivPtr));
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [_data length];
    
    int diff = kCCKeySizeAES128 - (dataLength % kCCKeySizeAES128);
    unsigned long int newSize = 0;
    
    //    if(diff > 0)
    //    {
    newSize = dataLength + diff;
    //    }
    
    char dataPtr[newSize];
    memcpy(dataPtr, [_data bytes], [_data length]);
    for(int i = 0; i < diff; i++)
    {
        dataPtr[i + dataLength] = 0x00;
    }
    
    size_t bufferSize = newSize + kCCBlockSizeAES128;
    
    void *buffer = malloc( bufferSize );
    memset(buffer, 0, bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt( kCCEncrypt, kCCAlgorithmAES128, 0x0000,
                                          keyPtr, kCCKeySizeAES128,
                                          ivPtr,
                                          dataPtr,
                                          sizeof(dataPtr),
                                          buffer, bufferSize, /* output */
                                          &numBytesEncrypted );
    if( cryptStatus == kCCSuccess )
    {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free( buffer ); //free the buffer
    return nil;
}

+ (NSData *)AES128DecryptWithKey:(NSString *)key withData:(NSData*)data iv:(NSString *) iv
{
    char keyPtr[kCCKeySizeAES128 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCBlockSizeAES128 + 1];
    memset(ivPtr, 0, sizeof(ivPtr));
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,  0x0000,
                                          keyPtr, kCCBlockSizeAES128,
                                          ivPtr,
                                          [data bytes],
                                          dataLength,
                                          buffer, bufferSize, /* output */
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    
    free(buffer); //free the buffer;
    return nil;
}

- (NSString *)base64EncodingWithSafeUrl{
    NSString *dataString=[self base64Encoding];
    dataString=[dataString stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    dataString=[dataString stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    dataString=[dataString stringByReplacingOccurrencesOfString:@"=" withString:@""];
    return dataString;
}
@end
