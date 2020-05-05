// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <Peeps/Peeps.h>

@interface PersonTests : XCTestCase
@end

@implementation PersonTests

- (void)testCreatePerson {
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Frederick"];
    NSLog(@"Fred's first name is %@", [fred firstName]);
    
    [fred setLastName:@"Smith"];
    [fred setAge:42];
    NSLog(@"Fred's name is %@", fred);
}

- (void)testDesignatedInitializer {
    Person *fred = [[Person alloc] initWithFirstName:@"Fred"
                                            lastName:@"Smith"
                                                 age: 42];
    NSLog(@"%@", fred);
    
    Person *barb = [Person personWithFirstName:@"Barbara"
                                      lastName:@"Smith"
                                           age:32];
    NSLog(@"%@", barb);
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
