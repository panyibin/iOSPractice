//
//  ViewController.m
//  KVCTest
//
//  Created by yibinpan on 6/8/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "UserInfo.h"
#import "TestData.h"

@interface ViewController ()
{
    Person *mMan;
    UserInfo *mUserInfo;
    TestData *mTestData;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    mMan = [Person new];
    
    [mMan setValue:@"mike" forKey:@"name"];
    
    NSLog(@"name:%@", mMan.name);
    
    [mMan setValue:@12 forKey:@"age"];
    
    [mMan setValue:@"adfasdfsdf" forKey:@"customDic"];
    
    [mMan addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    
    NSLog(@"age:%ld", (long)mMan.age);
    
    NSLog(@"country length:%lu", (unsigned long)mMan.country.length);
    
    if ([mMan.customDic isKindOfClass:[NSDictionary class]]) {
        
        NSLog(@"customDic count: %lu", (unsigned long)mMan.customDic.count);
    }
    else if ([mMan.customDic isKindOfClass:[NSString class]])
    {
        NSLog(@"customDic is a NSString, length:%lu", (unsigned long)[(NSString*)mMan.customDic length]);
    }
    
    NSArray *array = [NSArray arrayWithObjects:@"test", nil];
    
    array = nil;
    
    NSLog(@"array count:%d", [array count]);
    
    for (NSString *str in array) {

        NSLog(@"str:%@", str);
    }
    
    mTestData = [[TestData alloc]initWithDictionary:nil];
    
    [mTestData setValue:@"test" forKey:@"abc"];
    
    mUserInfo = [[UserInfo alloc]initWithDictionary:nil];
    
    NSLog(@"balance 1:%ld", (long)mUserInfo.balance.available);
    
    //get data
    //https://www.bing.com/msrewards/api/v1/getUserInfo?mkt=en-us
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.bing.com/msrewards/api/v1/getUserInfo?mkt=en-us"]];
    
    request.HTTPMethod = @"POST";
    
    
    NSString *requestBodyStringFormat = @"{\"PartnerId\":\"rewardsapp\", \"UserId\":\"%@\",\"Channel\":\"mobile\", \"Options\":{\"FetchOffers\":true, \"FetchSuggestedRewards\":true, \"OfferLayoutType\":\"MissionTaskLayout\"}}";
    
    //@"96BF8F523AB1530754A257DBFFFFFFFF"
    NSString *requestBodyString = [NSString stringWithFormat:requestBodyStringFormat, @"96BF8F523AB1530754A257DBFFFFFFFF"];
    NSData* data = [requestBodyString dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = data;
    
    NSOperationQueue* backgroundQueue = [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:backgroundQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (data != nil) {
            
            NSError *error;
            NSMutableDictionary *userInfo = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            //NSLog(@"user info:%@", userInfo);
            
            mUserInfo = [[UserInfo alloc]initWithDictionary:userInfo];
            
            //        if (mUserInfo.balance.available ) {
            //            <#statements#>
            //        }
            //NSLog(@"offer 1:%@", ((OffersItem*)[mUserInfo.offersArray objectAtIndex:2]).attributes.answerScenario);
            NSLog(@"levelUpTasks nextUserLevel Name:%@", mUserInfo.levelUpTasks.nextUserLevelName);
            NSLog(@"available:%ld", (long)mUserInfo.balance.available);
            NSLog(@"RafShareUrl:%@", mUserInfo.rafShareUrl);
            NSLog(@"StatusLevel:%@", mUserInfo.statusLevel);
            NSLog(@"Offers:%@", mUserInfo.offersArray);
            NSLog(@"suggested Rewards:%@", mUserInfo.suggestedRewardsArray);
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([mMan isEqual:object]) {
        if ([keyPath isEqualToString:@"age"]) {
            
            NSLog(@"change:%@", change);
            NSLog(@"age new value:%ld", (long)mMan.age);
        }
    }}

- (IBAction)myButton:(id)sender {
    
    mMan.age = 1;
}

- (void)dealloc
{
    [mMan removeObserver:self forKeyPath:@"age"];
    NSLog(@"dealloc");
}
@end
