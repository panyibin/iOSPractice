//
//  ViewController.m
//  MemoryTest
//
//  Created by yibinpan on 7/7/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

static int count = 0;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _myLabel = [[[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 20)] autorelease];
    _myLabel.text = @"myLabel";
    [_myLabel sizeToFit];
    
    [self.view addSubview:_myLabel];
    
    _label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 100, 20)];
    _label2.text = @"myLabel";
    [_label2 sizeToFit];
    
    [self.view addSubview:_label2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeText:(UILabel*)label
{
    [label retain];
    
    label.text = [NSString stringWithFormat:@"google %d", count++];
    
    [label sizeToFit];
}

- (void)dealloc {
    
    [super dealloc];
}
- (IBAction)clickButton:(id)sender {
    
    [self changeText:self.myLabel];
    
    [self.label2 removeFromSuperview];
    
    _label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 100, 20)];
    _label2.text = [NSString stringWithFormat:@"myLabel:%d", count];
    [_label2 sizeToFit];
    
    [self.view addSubview:_label2];
    
    __weak ViewController *safeSelf = self;
    
    dispatch_async(dispatch_get_main_queue(), ^{
       
        [safeSelf changeText:nil];
        
    });
}
@end
