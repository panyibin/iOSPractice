//
//  ViewController.m
//  BlockTest
//
//  Created by yibinpan on 6/30/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int result = ^(int a) {return a * a;}(5);
    
    int (^myBlock)(int);
    
    static int myOut = 5;
    
    NSMutableArray *myArray = [NSMutableArray arrayWithObjects:@"test",@"test2", @"test3", nil];
    
    myBlock = ^(int a){myOut++; return myOut + a;};
    
    [myArray removeLastObject];
    
    myOut = 8;
    
    NSLog(@"result:%d", result);

    NSLog(@"myBlock result:%d", myBlock(5));

    
    [self myFunction:@"test" handler:myBlock];
    
    [self myFunction2:@"test2" handler:^(int a) {
        NSLog(@"myFunction2 block:%d", a);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)myFunction:(NSString*)myString handler:(int(^)(int))myBlock
{
    NSLog(@"in myFunction, myBlock: %d",myBlock(6));
}

- (void)myFunction2:(NSString*)myString handler:(void(^)(int a))myBlock
{
    NSLog(@"in myFunction, myBlock");
    
    myBlock(6);
}

@end
