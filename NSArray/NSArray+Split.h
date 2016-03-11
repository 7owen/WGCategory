//
//  NSArray+Split.h
//  Comikon
//
//  Created by Wen on 15/3/26.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (Split)

- (void)splitLength:(NSInteger)splitLength splitResult:(void(^)(NSInteger idx, NSArray *array))splitResult;

@end
