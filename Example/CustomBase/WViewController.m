//
//  WViewController.m
//  CustomBase
//
//  Created by xuewei.zhang on 08/05/2022.
//  Copyright (c) 2022 xuewei.zhang. All rights reserved.
//

#import "WViewController.h"
#import "CustomBase/Tool.h"

@interface WViewController ()

@end

@implementation WViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    BOOL isvaild = [Tool validateNumber:@"13162906707"];
    NSLog(@"isvaild = %d", isvaild);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
