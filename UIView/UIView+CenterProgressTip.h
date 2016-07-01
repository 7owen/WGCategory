//
//  UIView+ProgressTip.h
//  Comikon
//
//  Created by 7owen on 15/10/16.
//
//

#import <UIKit/UIKit.h>

@interface UIView (ProgressTip)

- (void)showCenterLoadingTip;
- (void)showCenterLoadingTipAfterDelay:(NSTimeInterval)delay;
- (void)showCenterLoadingTipWithStatus:(NSString*)status;
- (void)showCenterLoadingTipWithStatus:(NSString*)status afterDelay:(NSTimeInterval)delay;
- (void)dismissCenterLoadingTip;

@end
