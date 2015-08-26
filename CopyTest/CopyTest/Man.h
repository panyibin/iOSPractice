//
//  Man.h
//  CopyTest
//
//  Created by yibinpan on 8/19/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Man : Person
@property (nonatomic, strong) NSString *name;
-(instancetype)init;
-(void)sayHello;

-(void)testMethod;
@end
