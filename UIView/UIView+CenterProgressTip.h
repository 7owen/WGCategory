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
- (void)showCenterLoadingTipWithStatus:(NSString*)status;
- (void)dismissCenterLoadingTip;

@end
