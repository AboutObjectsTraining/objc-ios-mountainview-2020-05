// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewController.h"
#import "CLNCoolViewCell.h"

@implementation CLNCoolViewController

- (void)loadView {
    UIView *backgroundView = [[UIView alloc] init];
    self.view = backgroundView;
    
    CLNCoolViewCell *subview1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 100, 200, 40)];
    CLNCoolViewCell *subview2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(50, 160, 200, 40)];
    
    subview1.text = @"Hello World! 🌎🌏🌍";
    subview2.text = @"Cool Cells FTW!!! 🥂🍾";
    
    [backgroundView addSubview:subview1];
    [backgroundView addSubview:subview2];
    
    backgroundView.backgroundColor = UIColor.brownColor;
    subview1.backgroundColor = UIColor.purpleColor;
    subview2.backgroundColor = UIColor.orangeColor;
}

@end
