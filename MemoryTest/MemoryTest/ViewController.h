//
//  ViewController.h
//  MemoryTest
//
//  Created by yibinpan on 7/7/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, strong) UILabel *myLabel;
@property (nonatomic, retain) UILabel *label2;

- (IBAction)clickButton:(id)sender;
@end

