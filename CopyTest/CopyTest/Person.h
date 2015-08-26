//
//  Person.h
//  CopyTest
//
//  Created by yibinpan on 8/18/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCopying>
@property (nonatomic, strong) NSString *name;

-(instancetype)init;
-(void)sayHello;

@end
