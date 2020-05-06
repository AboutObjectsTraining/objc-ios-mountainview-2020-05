// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface UnitTests : XCTestCase @end

void sayHello(void) {
    printf("Hello!\n");
}

void saySomethingNTimes(int count, void (*thingToSay)(void)) {
    for (int i = 0; i < count; i++) {
        thingToSay();
    }
}

void saySomethingNTimesWithBlock(int count, void (^block)(void)) {
    for (int i = 0; i < count; i++) {
        block();
    }
}

@implementation UnitTests

- (void)testFunctionPointer {
    
    void (*myPtr)(void) = sayHello;
    myPtr();
    saySomethingNTimes(3, sayHello);
}

- (void)testBlockLiteral {
    const char *name = "Fred";
    
    void (^myBlock)(void) = ^(void) {
        printf("Hey there %s!\n", name);
    };
    
    myBlock();
    NSLog(@"%@", myBlock);
    
    name = "Foobar";
    
    saySomethingNTimesWithBlock(3, myBlock);
}

@end
