//
//  ViewController.m
//  NSCannerAndShaperChangeButton
//
//  Created by peng on 15/7/28.
//  Copyright © 2015年 peng. All rights reserved.
//

#import "ViewController.h"
#import "ChangeButtonView.h"
@interface ViewController ()
{
    CAShapeLayer * _testLayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional se
    
    
    ChangeButtonView * change = [[ChangeButtonView alloc]init];
    change.tintColor = [UIColor redColor];
    
    [self.view addSubview:change];
    [change startAnimating];
    [self customButton];
    
    
    UIBezierPath * bezer = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:20 startAngle:- M_PI_2 endAngle:(M_PI * 2)- M_PI_2 clockwise:YES];
    
    _testLayer = [CAShapeLayer layer];
    _testLayer.frame = CGRectMake(100, 300, 100, 100);
    
    _testLayer.path = bezer.CGPath;
    
    _testLayer.strokeColor = [UIColor yellowColor].CGColor;
    _testLayer.lineWidth = 1.0f;
    [self.view.layer addSublayer:_testLayer];
    
}



- (void)customButton
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    
    UIFont * font = [UIFont systemFontOfSize:10];
    button.titleLabel.font = font;
    [button setTitle:@"修改之前" forState:UIControlStateNormal];
    
    
    button.frame = CGRectMake(100, 200, 80, 40);
    [self.view addSubview:button];
    
    
    
    
    [UIView animateWithDuration:0.3 delay:2. usingSpringWithDamping:0.8 initialSpringVelocity:0 options:
     UIViewAnimationOptionCurveLinear animations:^{
         
         button.transform = CGAffineTransformScale(button.transform , 1.5, 1.5);
     } completion:^(BOOL finished) {
        button.transform = CGAffineTransformMakeScale(1., 1.);

     }];
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
       button.layer.bounds = CGRectMake(0, 0,40, 40);
    } completion:^(BOOL finished) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
        animation.timingFunction = [CAMediaTimingFunction     functionWithName:kCAMediaTimingFunctionLinear];
        
        animation.fromValue = [NSNumber numberWithFloat:0];
        animation.toValue = [NSNumber numberWithFloat:20];
        animation.duration = 0.2;
        
        [button.layer setCornerRadius:20];
        [button.layer addAnimation:animation forKey:@"cornerRadius"];
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            button.layer.bounds = CGRectMake(0, 0, 40, 40);
        } completion:^(BOOL finished) {
//            bgView.hidden = YES;
//            _isLoading = NO;
        }];
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
