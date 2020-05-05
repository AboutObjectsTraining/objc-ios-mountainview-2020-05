// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import "Person.h"
#import "Dog.h"

@interface UnitTests : XCTestCase
@end

@implementation UnitTests

- (void)testCreatePerson {
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Frederick"];
    NSLog(@"Fred's first name is %@", [fred firstName]);
    
    [fred setLastName:@"Smith"];
    [fred setAge:42];
    NSLog(@"Fred's name is %@", fred);
}

- (void)testBarkLikeADog {
    id fred = [[Person alloc] init];
    [fred setFirstName:@"Frederick"];
    [fred setLastName:@"Smith"];
    [fred setAge:42];
    
    Dog *dog = [[Dog alloc] init];
    [fred setDog:dog];
    
    [fred bark];
}

@end
