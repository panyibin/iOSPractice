//
//  OffersInfo.m
//  KVCTest
//
//  Created by yibinpan on 6/9/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "OffersItem.h"

@implementation OffersItem

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"Description"]) {

        self.offerDescription = value;
    }
    else if([key isEqualToString:@"Id"])
    {
        self.offerId = value;
    }
    else if([key isEqualToString:@"Attributes"])
    {
        if ([value isKindOfClass:[NSDictionary class]]) {
            
            self.attributes = [[AttributesInfo alloc]initWithDictionary:value];
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

@end
