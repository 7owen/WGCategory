//
//  NSObject+Swizzle.m
//  Comikon
//
//  Created by 7owen on 15/8/24.
//
//

#import "NSObject+Swizzle.h"
#include "objc/runtime.h"

BOOL class_swizzleMethodAndStore(Class class, SEL original, IMP replacement, IMPPointer store);
BOOL class_swizzleMethodAndStore(Class class, SEL original, IMP replacement, IMPPointer store) {
    IMP imp = NULL;
    Method method = class_getInstanceMethod(class, original);
    if (method) {
        const char *type = method_getTypeEncoding(method);
        imp = class_replaceMethod(class, original, replacement, type);
        if (!imp) {
            imp = method_getImplementation(method);
        }
    }
    if (imp && store) {
        *store = imp;
    }
    return (imp != NULL);
}


@implementation NSObject (Swizzle)

+ (BOOL)swizzle:(SEL)original with:(IMP)replacement store:(out IMPPointer)store {
    return class_swizzleMethodAndStore(self, original, replacement, store);
}

@end
