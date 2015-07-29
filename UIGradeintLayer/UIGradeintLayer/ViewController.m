//
//  ViewController.m
//  UIGradeintLayer
//
//  Created by peng on 15/7/29.
//  Copyright © 2015年 peng. All rights reserved.
//

#import "ViewController.h"
#import "MuticolorView.h"
#import "MutableSelfColor.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MuticolorView * mutable = [[MuticolorView alloc]initWithFrame:CGRectMake(100, 100, 150, 150)];
    [mutable startAnimation];
    [self.view addSubview:mutable];
    
    
    MutableSelfColor * selfcolor = [[MutableSelfColor alloc]initWithFrame:self.view.bounds];
    
    [selfcolor startAnimation];
    [self.view addSubview:selfcolor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
