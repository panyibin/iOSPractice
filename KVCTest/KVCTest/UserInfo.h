//
//  UserInfo.h
//  KVCTest
//
//  Created by yibinpan on 6/8/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonModel.h"
#import "Balance.h"
#import "OffersItem.h"
#import "LevelUpTasks.h"
#import "SuggestedRewardsItem.h"
#import "UserAttributes.h"
#import "Balance.h"

@interface UserInfo : JsonModel

@property (nonatomic, strong) Balance *balance;
@property (nonatomic, strong) NSString *rafShareUrl;
@property (nonatomic, strong) NSString *statusLevel;
@property (nonatomic, strong) NSMutableArray *offersArray;
@property (nonatomic, strong) LevelUpTasks *levelUpTasks;
@property (nonatomic, strong) NSString *bruid;
@property (nonatomic, assign) BOOL rewardsUser;
@property (nonatomic, strong) NSMutableArray *suggestedRewardsArray;
@property (nonatomic, strong) UserAttributes *userAttributes;

-(id)init;

@end
