// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"

@implementation Person

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return [self dog];
}

- (NSString *)firstName {
    return _firstName;
}
- (void)setFirstName:(NSString *)newValue {
    _firstName = [newValue copy];
}

- (NSString *)lastName {
    return _lastName;
}
- (void)setLastName:(NSString *)newValue {
    _lastName = [newValue copy];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

- (NSInteger)age {
    return _age;
}
- (void)setAge:(NSInteger)newValue {
    _age = newValue;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@, age: %@", [self fullName], @([self age])];
}

- (Dog *)dog {
    return _dog;
}
- (void)setDog:(Dog *)newValue {
    _dog = newValue;
}

@end
