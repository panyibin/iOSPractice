//
//  Man.m
//  CopyTest
//
//  Created by yibinpan on 8/19/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "Man.h"

@implementation Man

-(instancetype)init
{
    self = [super init];
    
    if (self) {
        
//        NSLog(@"class name x:%@", NSStringFromClass([self class]));
//        
//        NSLog(@"super class name x:%@", NSStringFromClass([super class]));
        self.name = @"Man Name";
        
    }
    
    return self;
}

-(void)sayHello
{
    NSLog(@"say hello, man, your name:%@", self.name);
}

-(void)testMethod
{
    NSLog(@"class name x:%@", NSStringFromClass([self class]));
    
    NSLog(@"super class name x:%@", NSStringFromClass([super class]));
    
    NSLog(@"super class name x:%@", NSStringFromClass([self superclass]));
    
    [self sayHello];
    [super sayHello];
}
@end
