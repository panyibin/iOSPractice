//
//  LevelUpTasks.h
//  KVCTest
//
//  Created by yibinpan on 6/9/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "JsonModel.h"
#import "LevelPrivilege.h"
#import "NextLevelTask.h"

@interface LevelUpTasks : JsonModel
@property (nonatomic, strong) NSMutableArray* levelPrivilegesArray;
@property (nonatomic, strong) NSMutableArray* nextLevelTasksArray;
@property (nonatomic, strong) NSString *nextUserLevelName;

-(id)init;
@end
