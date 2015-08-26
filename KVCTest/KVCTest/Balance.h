//
//  Balance.h
//  KVCTest
//
//  Created by yibinpan on 6/9/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "JsonModel.h"

@interface Balance : JsonModel
@property (nonatomic, assign) NSInteger available;
@property (nonatomic, assign) NSInteger inProgress;
@property (nonatomic, assign) NSInteger lifetime;
@property (nonatomic, assign) NSInteger redeemed;
@end
