//
//  ViewController.m
//  CrashTest
//
//  Created by yibinpan on 7/14/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableDictionary *mutableDict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"abc", @"name", nil];
    
    NSLog(@"%@", [mutableDict objectForKey:@"name"]);
    
    NSMutableArray *myArray = [[NSMutableArray alloc]initWithObjects:@"test", nil];
    
    NSString *myString = nil;
    
//    [myArray insertObject:myString atIndex:0];
    
    NSMutableArray *someObject = [NSMutableArray array];
    NSLog(@"%s:%d someObject=%@", __func__, __LINE__, someObject);
    [someObject addObject:@"foo"];
    NSLog(@"%s:%d someObject=%@", __func__, __LINE__, someObject);
    
    NSLog(@"file path:%s", __FILE__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
