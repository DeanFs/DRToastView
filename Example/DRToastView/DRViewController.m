//
//  DRViewController.m
//  DRToastView
//
//  Created by Dean_F on 07/16/2019.
//  Copyright (c) 2019 Dean_F. All rights reserved.
//

#import "DRViewController.h"
#import <DRToastView/DRToastView.h>

@interface DRViewController ()

@end

@implementation DRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [DRToastView setupBackgroundColor:[UIColor redColor] textColor:nil textFont:[UIFont systemFontOfSize:18]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [DRToastView showWithMessage:@"点击了屏幕" complete:nil];
}

@end
