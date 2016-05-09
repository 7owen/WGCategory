//
//  UISegmentedControl+Block.h
//  Comikon
//
//  Created by 7owen on 14-3-11.
//
//

#import <UIKit/UIKit.h>

@interface UISegmentedControl (Block)

- (id)initWithFrame:(CGRect)frame items:(NSArray*)items andSelectionBlock:(void(^)(NSUInteger segmentIndex))block;

@end
