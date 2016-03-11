//
//  NSObject+Swizzle.h
//  Comikon
//
//  Created by 7owen on 15/8/24.
//
//

#import <Foundation/Foundation.h>

typedef IMP *IMPPointer;

@interface NSObject (Swizzle)

+ (BOOL)swizzle:(SEL)original with:(IMP)replacement store:(out IMPPointer)store;

@end
