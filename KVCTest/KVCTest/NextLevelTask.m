//
//  NextLevelTasks.m
//  KVCTest
//
//  Created by yibinpan on 6/9/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "NextLevelTask.h"

@implementation NextLevelTask

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"Description"]) {
        self.nextLevelTaskDescription = value;
    }
    else
    {
        [super setValue:value forKey:key];
    }
}
@end
