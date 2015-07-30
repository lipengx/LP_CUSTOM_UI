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
#import "CustomMutiColor.h"
#import "CAMutiColor.h"

@interface ViewController ()
@property (nonatomic,strong)CustomMutiColor * showView;
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
    
    
    
    
    
    _showView           = [[CustomMutiColor alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _showView.lineWidth = 1.f;
    _showView.sec       = 2.f;
    _showView.colors    = @[(id)[UIColor cyanColor].CGColor,
                            (id)[UIColor yellowColor].CGColor,
                            (id)[UIColor cyanColor].CGColor];
    _showView.center    = self.view.center;
    NSTimer * time              = [NSTimer scheduledTimerWithTimeInterval:1
                                                           target:self
                                                         selector:@selector(event:)
                                                         userInfo:nil
            
                                                                  repeats:YES];
    _showView.lineWidth = 2.3;
    [self.view addSubview:_showView];
    [_showView startAnimation];
    
    
    
    
    
    
    CAMutiColor * mutableColor = [[CAMutiColor alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    mutableColor.center = CGPointMake(self.view.center.x,570);
    [mutableColor startAnimating];
   mutableColor.backgroundColor =[UIColor redColor];
    [self.view addSubview:mutableColor];
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)event:(id)object
{
    _showView.percent = arc4random()%100/100.f;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
