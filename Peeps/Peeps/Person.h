// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

@class Dog;

@interface Person : NSObject {
    NSString *_firstName;
    NSString *_lastName;
    NSInteger _age;
    NSUInteger _rating;
    Dog *_dog;
}

- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName;

+ (id)personWithFirstName:(NSString *)firstName
                 lastName:(NSString *)lastName
                      age:(NSInteger)age;

- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName
                    age:(NSInteger)age;

- (NSString *)firstName;
- (void)setFirstName:(NSString *)newValue;

- (NSString *)lastName;
- (void)setLastName:(NSString *)newValue;

- (NSString *)fullName;

- (NSInteger)age;
- (void)setAge:(NSInteger)newValue;

- (Dog *)dog;
- (void)setDog:(Dog *)newValue;

- (NSUInteger)rating;
- (void)setRating:(NSUInteger)newValue;

- (void)display;

@end
