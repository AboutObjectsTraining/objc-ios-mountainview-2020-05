// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "UIImageView+RELAdditions.h"

@interface UIImageView ()
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@end

@implementation UIImageView (RELAdditions)

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

@end
