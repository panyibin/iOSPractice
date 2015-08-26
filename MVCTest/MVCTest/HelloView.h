//
//  HelloView.h
//  MVCTest
//
//  Created by yibinpan on 7/20/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloView : UIView

@property (nonatomic, strong) UILabel *myLabel;
@property (nonatomic, strong) UIButton *myButton;
@property (nonatomic, strong) UIButton *downloadButton;

-(id)initWithFrame:(CGRect)frame;
@end
