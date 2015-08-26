//
//  ViewController.m
//  ViewDidLoadTest3
//
//  Created by yibinpan on 3/16/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "ViewController.h"
#import "myViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButton:(id)sender {
    
    myViewController* myVC = [[myViewController alloc]initWithNibName:@"myViewController" bundle:nil];
    
    [self presentViewController:myVC animated:YES completion:^{
        
    }];
}
@end
