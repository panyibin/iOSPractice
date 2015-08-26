//
//  AttributesInfo.m
//  KVCTest
//
//  Created by yibinpan on 6/9/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "AttributesInfo.h"

@implementation AttributesInfo

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"AnswerScenario.Tag"]) {

        self.answerScenario = value;
    }
    else if ([key isEqualToString:@"Classification.Tag"])
    {
        self.classfication = value;
    }
}

@end
