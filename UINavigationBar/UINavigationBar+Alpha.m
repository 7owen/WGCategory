//
//  UINavigationBar+Alpha.m
//  Comikon
//
//  Created by 7owen on 14-8-15.
//
//

#import "UINavigationBar+Alpha.h"

@implementation UINavigationBar (Alpha)

- (CGFloat)barBgAlpha {
    CGFloat alpha = 1.f;
    for (UIView *view in self.subviews) {
        if ([NSStringFromClass([view class])isEqualToString:@"_UINavigationBarBackground"]) {
            alpha = view.alpha;
            break;
        }
    }
    return alpha;
}

- (void)setBarBgAlpha:(CGFloat)barBgAlpha {
    for (UIView *view in self.subviews) {
        if ([NSStringFromClass([view class])isEqualToString:@"_UINavigationBarBackground"]) {
            //            for (UIView *subView in view.subviews) {
            //                subView.alpha = 0.9f;
            //            }
            view.alpha = barBgAlpha;
            break;
        }
    }
}

@end
