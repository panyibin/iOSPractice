//
//  ProductInfo.h
//  KVCTest
//
//  Created by yibinpan on 6/9/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "JsonModel.h"

@interface ProductInfo : JsonModel
@property (nonatomic, strong) NSString *category;
@property (nonatomic, assign) NSInteger credits;
@property (nonatomic, assign) NSInteger discountedCredits;
@property (nonatomic, strong) NSString *extraLargeImageUrl;
@property (nonatomic, strong) NSDictionary *itemDescription;//TODO:YIBINPAN
@property (nonatomic, strong) NSString *largeImageUrl;
@property (nonatomic, strong) NSString *largeShowcaseImageUrl;
@property (nonatomic, strong) NSString *MediumImageUrl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *showcaseImageUrl;
@property (nonatomic, strong) NSString *sku;
@property (nonatomic, strong) NSString *smallImageUrl;
@property (nonatomic, strong) NSString *supplier;

@end
