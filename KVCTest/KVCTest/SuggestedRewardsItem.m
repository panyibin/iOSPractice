//
//  SuggestedRewards.m
//  KVCTest
//
//  Created by yibinpan on 6/9/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "SuggestedRewardsItem.h"

@implementation SuggestedRewardsItem

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"Product"]) {
        self.product = [[ProductInfo alloc]initWithDictionary:value];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

@end
