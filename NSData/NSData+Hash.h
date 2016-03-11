//
//  NSData+Hash.h
//  Comikon
//
//  Created by 7owen on 16/3/11.
//
//

#import <Foundation/Foundation.h>

@interface NSData (Hash)

- (NSString*)md5;
- (NSString*)sha1;
- (NSString*)sha256;

@end
