//
//  UserAttributes.h
//  KVCTest
//
//  Created by yibinpan on 6/9/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "JsonModel.h"

@interface UserAttributes : JsonModel
@property (nonatomic, assign) NSInteger currentMonthSearchCount;
@property (nonatomic, strong) NSString *lastShippedOrderSku;
@property (nonatomic, assign) NSInteger rafCreditsPerReferral;
@property (nonatomic, assign) NSInteger rafMaxReferrals;
@property (nonatomic, assign) NSInteger rafPendingCredits;
@end
