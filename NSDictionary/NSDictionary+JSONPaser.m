//
//  NSDictionary+JSONPaser.m
//  Comikon
//
//  Created by 7owen on 14-8-1.
//
//

#import "NSDictionary+JSONPaser.h"

@implementation NSDictionary (JSONPaser)

- (id)objectForKey:(id)aKey isClass:(Class)aClass {
    id obj = [self objectForKey:aKey];
    if (obj && [obj isKindOfClass:aClass]) {
        return obj;
    }
    if (obj && ![obj isKindOfClass:[NSNull class]]) {
        CKLogError(@"Class mismatch when parsing json data, class required:%@, actual class:%@, key:%@", NSStringFromClass(aClass), NSStringFromClass([obj class]), aKey);
    }
    return nil;
}

@end
