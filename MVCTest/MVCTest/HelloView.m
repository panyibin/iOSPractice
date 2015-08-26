//
//  HelloView.m
//  MVCTest
//
//  Created by yibinpan on 7/20/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "HelloView.h"

@implementation HelloView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //self.backgroundColor = [UIColor blueColor];
        
        _myLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 100, 50)];
        _myLabel.backgroundColor = [UIColor yellowColor];
        
        [self addSubview:_myLabel];
        
        _myButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 200, 100, 50)];
        [_myButton setTitle:@"click me" forState:UIControlStateNormal];
        _myButton.backgroundColor = [UIColor greenColor];
        
        [self addSubview:_myButton];
        
        _downloadButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 300, 100, 50)];
        [_downloadButton setTitle:@"download file" forState:UIControlStateNormal];
        _downloadButton.backgroundColor = [UIColor greenColor];
        
        [self addSubview:_downloadButton];
    }
    
    NSLog(@"Hello View, initWithFrame called");
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
