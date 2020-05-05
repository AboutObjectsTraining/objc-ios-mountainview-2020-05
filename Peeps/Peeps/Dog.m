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

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", [self name]];
}

- (id)copyWithZone:(NSZone *)zone {
    Dog *newDog = [[[self class] allocWithZone:zone] init];
    newDog->_name = [[self name] copy];
//    newDog->isa = [NSString class];
    return newDog;
}

@end
