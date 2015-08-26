//
//  DownloadService.m
//  MVCTest
//
//  Created by yibinpan on 7/22/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "DownloadService.h"

@interface DownloadService()
{
    NSString *mUserAgent;
}
@end

@implementation DownloadService

-(id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

-(void)downloadFromUrl:(NSURL*)url
{
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    NSOperationQueue* backgroundQueue = [[NSOperationQueue alloc]init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:backgroundQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        [self.downloadServiceDelegate downloadFinished:response data:data error:connectionError];
        
    }];
}

@end
