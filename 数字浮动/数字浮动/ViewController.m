//
//  ViewController.m
//  数字浮动
//
//  Created by peng on 15/7/25.
//  Copyright © 2015年 peng. All rights reserved.
//

#import "ViewController.h"
#import "NumberModel.h"
@interface ViewController ()
{
    NumberModel * _model ;
    float _yesterdayNumberText;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.yesterdayNumber.text = @"0.0";
    
    [self performSelector:@selector(test) withObject:self afterDelay:0.3];
    
}
- (void)addModelr
{
    _model= [[NumberModel alloc]init];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}
- (void)test
{
    [self setNumberWithValue:1.2];
}
- (void)setNumberWithValue:(float)value

{
//    self.yesterdayNumber.text = [NSString stringWithFormat:@"%f",value];
   
    
    
    [self setNumberTextOfLabel:self.yesterdayNumber WithAnimationForValue:value];
    
}
- (void)setNumberTextOfLabel:(UILabel *)label WithAnimationForValue:(float)value
{
    CGFloat lastValue = [label.text floatValue];
    CGFloat delta = value - lastValue;
    
    
    if (delta == 0) return;
    
    if (delta > 0) {
        
       CGFloat ratio = value / 60.0;
        
        NSDictionary *userInfo = @{@"label" : label,
                                   @"value" : @(value),
                                   @"ratio" : @(ratio)
                                   };
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(setupLabel:) userInfo:userInfo repeats:YES];
        
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        
        
        
        
    }
}
- (void)setupLabel:(NSTimer *)timer
{
    
    NSLog(@"timer");
    NSDictionary * userInfo = timer.userInfo;
    UILabel *label = userInfo[@"label"];
    CGFloat value = [userInfo[@"value"] floatValue];
    CGFloat ratio = [userInfo[@"ratio"] floatValue];

    static int flag = 1;
    CGFloat lastValue = [label.text floatValue];
    CGFloat randomDelta = (arc4random_uniform(2) + 1) * ratio;
    
    CGFloat resValue = lastValue + randomDelta;
    
    if ((resValue >= value) || (flag == 50)) {
        label.text = [NSString stringWithFormat:@"%.2f", value];
        flag = 1;
        [timer invalidate];
        timer = nil;
        return;
    } else {
        label.text = [NSString stringWithFormat:@"%.2f", resValue];
        NSLog(@"%@",label.text);
        [self.view.layer setNeedsDisplay];
    }
    //
    flag++;

    
}

@end
