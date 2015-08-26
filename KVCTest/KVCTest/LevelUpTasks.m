//
//  LevelUpTasks.m
//  KVCTest
//
//  Created by yibinpan on 6/9/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "LevelUpTasks.h"

@implementation LevelUpTasks

-(id)init
{
    self = [super init];
    if (self) {
        self.levelPrivilegesArray = [[NSMutableArray alloc]initWithCapacity:1];
        self.nextLevelTasksArray = [[NSMutableArray alloc]initWithCapacity:1];
    }
    
    return self;
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"LevelPrivileges"] && [value isKindOfClass:[NSArray class]]) {
        
        for (NSMutableDictionary *levelPrivilegeDict in value) {
        
            LevelPrivilege *levelPrivilege = [[LevelPrivilege alloc]initWithDictionary:levelPrivilegeDict];
            
            [self.levelPrivilegesArray addObject:levelPrivilege];
        }
    }
    else if ([key isEqualToString:@"NextLevelTasks"])
    {
        for (NSMutableDictionary *nextLevelTaskDict in value) {
            
            NextLevelTask *nextLevelTask = [[NextLevelTask alloc]initWithDictionary:nextLevelTaskDict];
            
            [self.nextLevelTasksArray addObject:nextLevelTask];
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

@end
