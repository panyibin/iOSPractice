//
//  ViewController.m
//  OperationQueueTest
//
//  Created by yibinpan on 8/3/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "ViewController.h"
#import "NSTestOperation.h"

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

- (IBAction)clickStart:(id)sender {
    
    NSOperationQueue *testOperationQueue = [[NSOperationQueue alloc]init];
    
    NSTestOperation *testOperation1 = [[NSTestOperation alloc]init];
    
    [testOperationQueue addOperation:testOperation1];
    
    NSBlockOperation *blockOperation1 = [[NSBlockOperation alloc]init];
    [blockOperation1 addExecutionBlock:^{
       
        NSLog(@"execute operation 1");
    }];
    
    [blockOperation1 setCompletionBlock:^{
       
        NSLog(@"operation 1 completed");
    }];
    
    NSBlockOperation *blockOperation2 = [[NSBlockOperation alloc]init];
    [blockOperation2 addExecutionBlock:^{
        
        NSLog(@"execute operation 2");
    }];
    
    [blockOperation2 setCompletionBlock:^{
        
        NSLog(@"operation 2 completed");
    }];
    
    
    [blockOperation1 addDependency:blockOperation2];
    
    [testOperationQueue addOperations:[NSArray arrayWithObjects:blockOperation1, blockOperation2, nil] waitUntilFinished:NO];
    
    NSLog(@"finished clicking start");
    
    
}
@end
