//
//  ViewController.m
//  CopyTest
//
//  Created by yibinpan on 8/18/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *person = [[Person alloc]init];
    person.name = @"google";
    
    self.personCopy = person;
    self.personStrong = person;
    
    person.name = @"apple";
    
    NSLog(@"personCopy name:%@", self.personCopy.name);
    NSLog(@"personStrong name:%@", self.personStrong.name);
    
    Man *man = [[Man alloc]init];
    
    [man testMethod];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
