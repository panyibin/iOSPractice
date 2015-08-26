//
//  NextLevelTasks.h
//  KVCTest
//
//  Created by yibinpan on 6/9/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "JsonModel.h"

@interface NextLevelTask : JsonModel
@property (nonatomic, assign) BOOL completed;
@property (nonatomic, assign) NSInteger currentProgress;
@property (nonatomic, strong) NSString *nextLevelTaskDescription;
@property (nonatomic, strong) NSString *imageKey;
@property (nonatomic, assign) NSInteger maxProgress;
@property (nonatomic, assign) BOOL progressHasValue;
@property (nonatomic, strong) NSString *slideShowTourFinishUrl;
@property (nonatomic, strong) NSString *slideShowTourId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@end
