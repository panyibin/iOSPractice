//
//  ViewController.h
//  CopyTest
//
//  Created by yibinpan on 8/18/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "Man.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *myLabel;


@property (nonatomic, copy) Person *personCopy;
@property (nonatomic, strong) Person *personStrong;

@property (nonatomic, strong) Man *manStrong;

@end

