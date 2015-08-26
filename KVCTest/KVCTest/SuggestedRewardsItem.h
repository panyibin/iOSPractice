//
//  SuggestedRewards.h
//  KVCTest
//
//  Created by yibinpan on 6/9/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "JsonModel.h"
#import "ProductInfo.h"

@interface SuggestedRewardsItem : JsonModel
@property (nonatomic, strong) ProductInfo *product;
@property (nonatomic, strong) NSDictionary *reasons;//TODO:YIBINPAN

@end
