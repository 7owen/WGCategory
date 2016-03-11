//
//  NSArray+Split.m
//  Comikon
//
//  Created by Wen on 15/3/26.
//
//

#import "NSArray+Split.h"

@implementation NSArray (Split)

- (void)splitLength:(NSInteger)splitLength splitResult:(void(^)(NSInteger idx, NSArray *array))splitResult {
    if (splitResult) {
        if (splitLength <= 0) {
            splitResult(0, self);
        }
        NSInteger idx = 0;
        for (NSInteger j = 0; j < self.count; j += splitLength) {
            if (j + splitLength > self.count) {
                splitLength = self.count - j;
            }
            NSArray *splitArray = [self subarrayWithRange:NSMakeRange(j, splitLength)];
            if (splitArray) {
                splitResult(idx, splitArray);
                ++idx;
            }
        }
    }
}

@end
