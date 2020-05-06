// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewCell.h"

const UIEdgeInsets CLNTextInsets = {
    .top = 7,
    .bottom = 8,
    .left = 12,
    .right = 12,
};

@interface CLNCoolViewCell ()
@property (assign, getter=isHighlighted, nonatomic) BOOL highlighted;
@property (copy, class, readonly, nonatomic) NSDictionary *textAttributes;
@end

@implementation CLNCoolViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame])) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

// FIXME: Need to cover initWithCoder: eventually.

- (void)configureGestureRecognizers {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bounce)];
    recognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:recognizer];
}

- (void)configureLayer {
    self.layer.borderWidth = 3;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 10;
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
}

// MARK: - Animation

+ (void)animateWithDuration:(NSTimeInterval)duration
                 animations:(void (^)(void))animations {
    
}


- (void)bounce {
    NSLog(@"In %s", __func__);
}

// MARK: - Drawing and resizing

+ (NSDictionary *)textAttributes {
    return @{
        NSFontAttributeName : [UIFont boldSystemFontOfSize:21.0],
        NSForegroundColorAttributeName : UIColor.whiteColor,
    };
}

- (void)drawRect:(CGRect)rect {
    CGPoint origin = CGPointMake(CLNTextInsets.left, CLNTextInsets.top);
    [self.text drawAtPoint:origin withAttributes:self.class.textAttributes];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.width += CLNTextInsets.left + CLNTextInsets.right;
    newSize.height += CLNTextInsets.top + CLNTextInsets.bottom;
    return newSize;
}

// MARK: - UIResponder methods

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    self.highlighted = YES;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    
    CGFloat dx = currLocation.x - prevLocation.x;
    CGFloat dy = currLocation.y - prevLocation.y;
    
    self.frame = CGRectOffset(self.frame, dx, dy);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

@end
