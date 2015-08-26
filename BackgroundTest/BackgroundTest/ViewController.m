//
//  ViewController.m
//  BackgroundTest
//
//  Created by yibinpan on 14-11-25.
//  Copyright (c) 2014年 yibinpan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startBackgroundTask:(id)sender {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"bing://hello"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"bing://hello"]];
    }
    else
    {
        //asdf
        
        //
    }

}
@end
