//
//  DownloadService.h
//  MVCTest
//
//  Created by yibinpan on 7/22/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DownloadServiceDelegate <NSObject>

-(void)downloadFinished:(NSURLResponse*) response data:(NSData*)data error:(NSError*) connectionError;

@end

@interface DownloadService : NSObject

@property (nonatomic, weak) id<DownloadServiceDelegate> downloadServiceDelegate;

-(id)init;
-(void)downloadFromUrl:(NSURL*)url;

@end
