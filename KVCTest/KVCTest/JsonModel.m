//
//  JsonModel.m
//  KVCTest
//
//  Created by yibinpan on 6/8/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "JsonModel.h"

@implementation JsonModel
-(id)initWithDictionary:(NSDictionary*)jsonObject
{
    self = [self init];
    if (self) {
        
        if ([jsonObject isKindOfClass:[NSDictionary class]]) {
            
            [self setValuesForKeysWithDictionary:jsonObject];
        }
    }
    
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"undefined key:%@", key);
}

@end
