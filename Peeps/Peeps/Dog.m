// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Dog.h"

@implementation Dog

- (NSString *)name {
    return _name;
}
- (void)setName:(NSString *)newValue {
    _name = [newValue copy];
}

- (void)bark {
    printf("\nWoof! Woof!\n\n");
}

@end
