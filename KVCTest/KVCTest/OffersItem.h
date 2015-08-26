//
//  OffersInfo.h
//  KVCTest
//
//  Created by yibinpan on 6/9/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "JsonModel.h"
#import "AttributesInfo.h"

@interface OffersItem : JsonModel
@property (nonatomic, strong) NSString *activityType;
@property (nonatomic, strong) AttributesInfo *attributes;
@property (nonatomic, assign) BOOL completed;
@property (nonatomic, assign) NSInteger creditCap;
@property (nonatomic, assign) NSInteger creditProgress;
@property (nonatomic, strong) NSString *offerDescription;
@property (nonatomic, strong) NSString *offerId;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *smallImageUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;

@end
