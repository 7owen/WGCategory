//
//  UIView+ProgressTip.m
//  Comikon
//
//  Created by 7owen on 15/10/16.
//
//

#import "UIView+CenterProgressTip.h"
#import <objc/runtime.h>

static void *UIViewCenterProgressLabelKey = &UIViewCenterProgressLabelKey;
static void *UIViewCenterProgressIndicatorKey = &UIViewCenterProgressIndicatorKey;

static void *UIViewCenterLeftSpaceKey = &UIViewCenterLeftSpaceKey;
static void *UIViewCenterRightSpaceKey = &UIViewCenterRightSpaceKey;

@implementation UIView (CenterProgressTip)

- (void)showCenterLoadingTip {
    [self showCenterLoadingTipAfterDelay:0];
}

- (void)showCenterLoadingTipAfterDelay:(NSTimeInterval)delay {
    [self showCenterLoadingTipWithStatus:NSLocalizedString(@"正在载入...", nil) afterDelay:0];
}

- (void)showCenterLoadingTipWithStatus:(NSString*)status {
    [self showCenterLoadingTipWithStatus:status afterDelay:0];
}

- (void)showCenterLoadingTipWithStatus:(NSString*)status afterDelay:(NSTimeInterval)delay {
    NSMutableArray *constraints = [NSMutableArray arrayWithCapacity:8];
    
    UILabel *label = (UILabel*)objc_getAssociatedObject(self, UIViewCenterProgressLabelKey);
    UIActivityIndicatorView *indicatorView = (UIActivityIndicatorView*)objc_getAssociatedObject(self, UIViewCenterProgressIndicatorKey);
    UIView *leftSpaceView = (UIView*)objc_getAssociatedObject(self, UIViewCenterLeftSpaceKey);
    UIView *rightSpaceView = (UIView*)objc_getAssociatedObject(self, UIViewCenterRightSpaceKey);
    
    if (!leftSpaceView) {
        leftSpaceView = [UIView new];
        leftSpaceView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:leftSpaceView];
        [constraints addObject:[NSLayoutConstraint constraintWithItem:leftSpaceView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    }
    
    if (!rightSpaceView) {
        rightSpaceView = [UIView new];
        rightSpaceView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:rightSpaceView];
        [constraints addObjectsFromArray:@[[NSLayoutConstraint constraintWithItem:rightSpaceView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0], [NSLayoutConstraint constraintWithItem:leftSpaceView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:rightSpaceView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]]];
    }
    
    if (!label) {
        label = [UILabel new];
        objc_setAssociatedObject(self, UIViewCenterProgressLabelKey, label, OBJC_ASSOCIATION_RETAIN);
        [self addSubview:label];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [constraints addObjectsFromArray:@[[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.f], [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:rightSpaceView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.f]]];
    }
    
    if (!indicatorView) {
        indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        objc_setAssociatedObject(self, UIViewCenterProgressIndicatorKey, indicatorView, OBJC_ASSOCIATION_RETAIN);
        [self addSubview:indicatorView];
        indicatorView.translatesAutoresizingMaskIntoConstraints = NO;
        [constraints addObjectsFromArray:@[[NSLayoutConstraint constraintWithItem:indicatorView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.f], [NSLayoutConstraint constraintWithItem:indicatorView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:label attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-6], [NSLayoutConstraint constraintWithItem:indicatorView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:leftSpaceView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]]];
    }
    [self addConstraints:constraints];
    
    
    label.text = status;
    [indicatorView startAnimating];
    if (delay != 0) {
        label.hidden = YES;
        indicatorView.hidden = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            label.hidden = NO;
            indicatorView.hidden = NO;
        });
    }
}

- (void)dismissCenterLoadingTip {
    UILabel *label = (UILabel*)objc_getAssociatedObject(self, UIViewCenterProgressLabelKey);
    UIActivityIndicatorView *indicatorView = (UIActivityIndicatorView*)objc_getAssociatedObject(self, UIViewCenterProgressIndicatorKey);
    [label removeFromSuperview];
    [indicatorView removeFromSuperview];
    objc_setAssociatedObject(self, UIViewCenterProgressLabelKey, nil, OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self, UIViewCenterProgressIndicatorKey, nil, OBJC_ASSOCIATION_RETAIN);
}

@end
