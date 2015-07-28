//
//  ViewController.m
//  LPWActivityIndicator
//
//  Created by dong on 15-4-7.
//  Copyright (c) 2015年 LPW. All rights reserved.
//

#import "ViewController.h"
#import "LPWActivityIndicator.h"

@interface ViewController ()

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated

{
    self.view.backgroundColor = [UIColor redColor];
    
    CGRect  activityRect = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds)/4, CGRectGetWidth(self.view.bounds)/6);
    LPWActivityIndicator * AC = [[LPWActivityIndicator alloc]initWithFrame:activityRect];
    AC.center = self.view.center;
    AC.color = [UIColor colorWithRed:232.0/255.0f green:35.0/255.0f blue:111.0/255.0f alpha:1.0];

    [AC activityIndicatorOfLPWStartAnimaing];
    
    [self.view addSubview:AC];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
