//
//  UISegmentedControl+Block.m
//  Comikon
//
//  Created by 7owen on 14-3-11.
//
//

#import "UISegmentedControl+Block.h"
#import <objc/runtime.h>

static char segmentedControlBlockKey;

@implementation UISegmentedControl (Block)

- (id)initWithFrame:(CGRect)frame items:(NSArray*)items andSelectionBlock:(void(^)(NSUInteger segmentIndex))block {
    self = [self initWithItems:items];
    self.frame = frame;
    self.selectionBlock = block;
    [self addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    return self;
}

- (void)valueChanged:(UISegmentedControl*)segmentedControl {
    self.selectionBlock(segmentedControl.selectedSegmentIndex);
}

- (void)setSelectionBlock:(void(^)(NSUInteger segmentIndex))block {
    objc_setAssociatedObject(self,
                             &segmentedControlBlockKey,
                             block,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void(^)(NSUInteger segmentIndex))selectionBlock {
    return objc_getAssociatedObject(self, &segmentedControlBlockKey);
}

@end
