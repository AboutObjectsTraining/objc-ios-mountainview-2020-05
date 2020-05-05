// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

@class Dog;

@interface Person : NSObject

- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName;

+ (id)personWithFirstName:(NSString *)firstName
                 lastName:(NSString *)lastName
                      age:(NSInteger)age;

- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName
                    age:(NSInteger)age;

@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (readonly, nonatomic) NSString *fullName;
@property (assign, nonatomic) NSInteger age;
@property (strong, nonatomic) Dog *dog;
@property (assign, nonatomic) NSUInteger rating;

- (void)display;

@end
