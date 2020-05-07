// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewController.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolViewController () <UITextFieldDelegate>
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UIView *contentView;
@end

@implementation CLNCoolViewController

- (void)addCell {
    NSLog(@"In %s", __func__);
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    newCell.text = self.textField.text;
    newCell.backgroundColor = UIColor.blueColor;
    [self.contentView addSubview:newCell];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"In %s", __func__);
    [textField resignFirstResponder];
    return YES;
}

- (void)loadView {
    UIView *backgroundView = [[UIView alloc] init];
    self.view = backgroundView;
    
    CGRect screenRect = UIScreen.mainScreen.bounds;
    CGRect accesssoryRect;
    CGRect contentRect;
    CGRectDivide(screenRect, &accesssoryRect, &contentRect, 100, CGRectMinYEdge);
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:accesssoryRect];
    self.contentView = [[UIView alloc] initWithFrame:contentRect];
    
    self.contentView.clipsToBounds = YES;
    
    [backgroundView addSubview:accessoryView];
    [backgroundView addSubview:self.contentView];
    
    // Controls
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 50, 240, 30)];
    self.textField.placeholder = @"Enter some text";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.textField.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Add Cell" forState:UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectOffset(button.frame, 265, 50);
    
    [button addTarget:self action:@selector(addCell) forControlEvents:UIControlEventTouchUpInside];
    
    [accessoryView addSubview:self.textField];
    [accessoryView addSubview:button];
    
    // Cool Cells
    CLNCoolViewCell *cell1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 100, 200, 40)];
    CLNCoolViewCell *cell2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(50, 160, 200, 40)];
    
    cell1.text = @"Hello World! 🌎🌏🌍";
    cell2.text = @"Cool Cells FTW!!! 🥂🍾";
    
    [self.contentView addSubview:cell1];
    [self.contentView addSubview:cell2];
    
    accessoryView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    self.contentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
    
    backgroundView.backgroundColor = UIColor.brownColor;
    cell1.backgroundColor = UIColor.purpleColor;
    cell2.backgroundColor = UIColor.orangeColor;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"In %@, %s", self.class, __func__);
//    [super touchesBegan:touches withEvent:event];
//}

@end
