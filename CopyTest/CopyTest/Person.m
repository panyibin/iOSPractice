//
//  Person.m
//  CopyTest
//
//  Created by yibinpan on 8/18/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)init
{
    self = [super init];
    
    if (self) {
        
//        NSLog(@"class name:%@", NSStringFromClass([self class]));
//        
//        NSLog(@"super class name:%@", NSStringFromClass([super class]));
        self.name = @"Person Name";
        
    }
    
    return self;
}
-(id)copyWithZone:(NSZone *)zone
{
    Person *copy = [[Person alloc]init];
    
    if (copy) {
        
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}

-(void)sayHello
{
    NSLog(@"sayHello, Person, your name:%@", self.name);
}
//- (Class)class
//{
//    return [NSString class];
//}

@end
