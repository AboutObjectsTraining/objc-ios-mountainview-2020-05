// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewController.h"
#import "CLNCoolViewCell.h"

@implementation CLNCoolViewController

- (void)loadView {
    UIView *backgroundView = [[UIView alloc] init];
    self.view = backgroundView;
    backgroundView.backgroundColor = UIColor.brownColor;
    
    UIView *subview1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 100, 200, 40)];
    [backgroundView addSubview:subview1];
    subview1.backgroundColor = UIColor.purpleColor;
    
    UIView *subview2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(50, 160, 200, 40)];
    [backgroundView addSubview:subview2];
    subview2.backgroundColor = UIColor.orangeColor;

}

@end
