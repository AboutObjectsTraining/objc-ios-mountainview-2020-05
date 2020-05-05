// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Peeps/Peeps.h>

const NSUInteger MaxRating = 5;

@implementation Person

// Convenience init
- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName {
    return [self initWithFirstName:firstName lastName:lastName age:0];
}

// Factory method
+ (id)personWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age {
    return [[self alloc] initWithFirstName:firstName lastName:lastName age:age];
}

// Designated init
- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName
                    age:(NSInteger)age {
    if (!(self = [super init])) return nil;
    
    _firstName = [firstName copy];
    _lastName = [lastName copy];
    _age = age;
    
    return self;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }
    return [[self dog] respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([[self dog] respondsToSelector:aSelector]) {
        return [self dog];
    }
    return [super forwardingTargetForSelector:aSelector];
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

- (Dog *)dog {
    return _dog;
}
- (void)setDog:(Dog *)newValue {
    _dog = newValue;
}

- (void)display {
    printf("%s\n", [[self description] UTF8String]);
}

- (NSUInteger)rating {
    return _rating;
}
- (void)setRating:(NSUInteger)newValue {
    _rating = newValue > MaxRating ? MaxRating : newValue;
}

- (NSString *)ratingStars {
    NSUInteger rating = [self rating];
    if (rating == 0) return @"-";
    return [@"★★★★★" substringToIndex:rating];
}

- (NSString *)description
{
    NSString *stars = [self ratingStars];
    stars = [stars stringByPaddingToLength:MaxRating
                                withString:@" "
                           startingAtIndex:0];
    
    return [NSString stringWithFormat:@"%@  %@, age: %@", stars, [self fullName], @([self age])];
}

@end
