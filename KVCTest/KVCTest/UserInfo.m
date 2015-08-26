//
//  UserInfo.m
//  KVCTest
//
//  Created by yibinpan on 6/8/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

-(id)init
{
    self = [super init];
    if (self) {
        self.offersArray = [[NSMutableArray alloc]initWithCapacity:1];
        self.suggestedRewardsArray = [[NSMutableArray alloc]initWithCapacity:1];
    }
    
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    [super setValue:value forUndefinedKey:key];
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"Balance"]) {
        //if ([value isKindOfClass:[NSDictionary class]]) {
            self.balance = [[Balance alloc]initWithDictionary:value];
        //}
    }
    else if([key isEqualToString:@"Offers"])
    {
        for (NSMutableDictionary *offerItemDict in value) {
            
            if ([offerItemDict isKindOfClass:[NSDictionary class]]) {
                
                OffersItem *offerInfoItem = [[OffersItem alloc]initWithDictionary:offerItemDict];
                
                [self.offersArray addObject:offerInfoItem];
            }
        }
    }
    else if([key isEqualToString:@"SuggestedRewards"])
    {
        for (NSMutableDictionary *suggestedRewardsItemDict in value) {
            
            if ([suggestedRewardsItemDict isKindOfClass:[NSDictionary class]]) {
                
                SuggestedRewardsItem *suggestedRewardsItem = [[SuggestedRewardsItem alloc]initWithDictionary:suggestedRewardsItemDict];
                
                [self.suggestedRewardsArray addObject:suggestedRewardsItem];
            }
        }

    }
    else if([key isEqualToString:@"LevelUpTasks"])
    {
        self.levelUpTasks = [[LevelUpTasks alloc]initWithDictionary:value];
    }
    else if([key isEqualToString:@"UserAttributes"])
    {
        self.userAttributes = [[UserAttributes alloc]initWithDictionary:value];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

@end
