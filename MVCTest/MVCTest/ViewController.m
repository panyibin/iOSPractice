//
//  ViewController.m
//  MVCTest
//
//  Created by yibinpan on 7/20/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    HelloView *mHelloView;
    PersonModel *mPerson;
    NSInteger mAge;
}

@property (nonatomic, strong) DownloadService *downloadService;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.downloadService = [[DownloadService alloc]init];
    self.downloadService.downloadServiceDelegate = self;
    
    mHelloView = [[HelloView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:mHelloView];
    
    [mHelloView.myButton addTarget:self action:@selector(changeLabelText:) forControlEvents:UIControlEventTouchUpInside];
    [mHelloView.downloadButton addTarget:self action:@selector(clickDownload:) forControlEvents:UIControlEventTouchUpInside];
    
    mPerson = [PersonModel new];
    
    mPerson.name = @"google";
    mPerson.age = 15;
    mPerson.gender = @"man";
    
    //[self performSelector:<#(SEL)#> onThread:<#(NSThread *)#> withObject:<#(id)#> waitUntilDone:<#(BOOL)#> modes:<#(NSArray *)#>]
    //syslog
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)changeLabelText:(id)sender
{
    mPerson.name = [NSString stringWithFormat:@"Google %ld", (long)mAge++];
    mHelloView.myLabel.text = mPerson.name;
    [mHelloView.myLabel sizeToFit];
}

-(IBAction)clickDownload:(id)sender
{
    [self.downloadService downloadFromUrl:[NSURL URLWithString:@"https://bingrewardstest.blob.core.windows.net/test/rewards_app_config.json"]];
}

-(void)downloadFinished:(NSURLResponse *)response data:(NSData *)data error:(NSError *)connectionError
{
    if (!connectionError) {
        
        NSError *myError;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&myError];
        
        NSLog(@"download content:%@", dict);
    }
}

@end
