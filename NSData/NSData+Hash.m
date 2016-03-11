//
//  NSData+Hash.m
//  Comikon
//
//  Created by 7owen on 16/3/11.
//
//

#import "NSData+Hash.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (Hash)

- (NSString*)md5 {
    if(self == nil || [self length] == 0)
        return nil;
    
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, r);
    
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
}

- (NSString*)sha1 {
 
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(self.bytes, (unsigned int)self.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

- (NSString*)sha256 {
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA1(self.bytes, (unsigned int)self.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA256_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

@end
