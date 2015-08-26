//
//  Person.h
//  KVCTest
//
//  Created by yibinpan on 6/8/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *profession;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSDictionary *customDic;
@property (nonatomic, assign) NSInteger testNum;

@end
