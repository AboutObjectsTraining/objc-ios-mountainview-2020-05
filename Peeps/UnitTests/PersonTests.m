// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <Peeps/Peeps.h>

@interface PersonTests : XCTestCase
@end

@implementation PersonTests

- (void)testCreatePerson {
    Person *fred = [[Person alloc] init];
    
    fred.firstName = @"Frederick";
//    [fred setFirstName:@"Frederick"];
    
    NSLog(@"Fred's first name is %@", fred.firstName);
    
    fred.lastName = @"Smith";
    fred.age = 42;
//    [fred setLastName:@"Smith"];
//    [fred setAge:42];
    
    NSLog(@"Fred's name is %@", fred);
    
    XCTAssert(fred.age == 42);
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
    
    if ([fred respondsToSelector:@selector(count)]) {
        [fred count];
    }
    
    if ([fred respondsToSelector:@selector(bark)]) {
        [fred bark];
    }
    
    SEL barkSelector = @selector(bark);
    
    if ([fred respondsToSelector:barkSelector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [fred performSelector:barkSelector];
#pragma clang diagnostic pop
    }
}

- (void)testArrayOfPersons {
    NSMutableArray *beings = [@[
        [Person personWithFirstName:@"Barbara" lastName:@"Smith" age:32],
        [Person personWithFirstName:@"Fred" lastName:@"Smith" age:37],
        [Person personWithFirstName:@"Dee" lastName:@"Jones" age:42],
    ] mutableCopy];
    
    Dog *rover = [[Dog alloc] init];
    
    [beings addObject:rover];
    
    for (id currPerson in beings)
    {
        if ([currPerson respondsToSelector:@selector(firstName)]) {
            NSLog(@"%@", [currPerson firstName]);
        }
    }
}

- (void)testDisplayArrayOfPersons {
    NSArray *people = @[
        [Person personWithFirstName:@"Barbara" lastName:@"Smith" age:32],
        [Person personWithFirstName:@"Fred" lastName:@"Smith" age:37],
        [Person personWithFirstName:@"Dee" lastName:@"Jones" age:42],
    ];
    
    for (Person *person in people) {
        [person display];
    }
}

- (void)testPart04 {
    NSArray<Person *> *people = @[
        [Person personWithFirstName:@"Barbara" lastName:@"Smith" age:32],
        [Person personWithFirstName:@"Fred" lastName:@"Smith" age:37],
        [Person personWithFirstName:@"Dee" lastName:@"Jones" age:42],
        [Person personWithFirstName:@"Jan" lastName:@"White" age:23],
        [Person personWithFirstName:@"Mel" lastName:@"Blank" age:27],
    ];
    
    people[0].rating = 0;
//    [people[0] setRating:0];
    
    [people[1] setRating:3];
    [people[2] setRating:5];
    [people[3] setRating:3];
    [people[4] setRating:99];
    
    [people makeObjectsPerformSelector:@selector(display)];
}

- (void)testCopyingADog {
    Dog *rover = [[Dog alloc] init];
    [rover setName:@"Rover"];
    NSLog(@"%@", rover);
    
    Dog *copyOfRover = [rover copy];
    NSLog(@"%@", copyOfRover);
}

@end
