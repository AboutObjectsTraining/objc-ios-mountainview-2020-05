// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNAppDelegate.h"
//#import "CLNCoolViewCell.h"
#import "CLNCoolViewController.h"

@implementation CLNAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    NSLog(@"In %s", __func__);
    
    self.window = [[UIWindow alloc] init];
    self.window.backgroundColor = UIColor.yellowColor;
    self.window.rootViewController = [[CLNCoolViewController alloc] init];
    
//    UIView *backgroundView = [[UIView alloc] init];
//    [self.window addSubview:backgroundView];
//
//    backgroundView.backgroundColor = UIColor.brownColor;
//    backgroundView.frame = self.window.frame;
//
//    UIView *subview1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 100, 200, 40)];
//    [backgroundView addSubview:subview1];
//    subview1.backgroundColor = UIColor.purpleColor;
//
//    UIView *subview2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(50, 160, 200, 40)];
//    [backgroundView addSubview:subview2];
//    subview2.backgroundColor = UIColor.orangeColor;
    
    [self.window makeKeyAndVisible];
}

@end
