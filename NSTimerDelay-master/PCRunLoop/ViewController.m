//
//  ViewController.m
//  PCRunLoop
//
//  Created by A-Hing on 15/9/16.
//  Copyright (c) 2015年 A-Hing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (nonatomic,strong)NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_myScrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 2000)];
    
    [self timerMethod1];
//    [self timerMethod2];
}

- (void)timerMethod1 {
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1. target:self selector:@selector(showTime) userInfo:nil repeats:YES];
//    self.timer = [NSTimer timerWithTimeInterval:1. target:self selector:@selector(showTime) userInfo:nil repeats:YES];
    /*
     方法一：
     NSTimer 加入到的 RunLoop 的 "commonModeItems" 中。"commonModeItems" 被 RunLoop 自动更新到所有具有"Common"属性的 Mode 里去，
     这样就可以避免被复杂运算操作或者UI界面刷新所干扰
     */
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)timerMethod2 {
    
    /*
        方法二：
        开辟子线程：（使用子线程的runloop）
    */
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(newThread) object:nil];
    [thread start];
}

- (void)newThread
{
    @autoreleasepool
    {
        
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showTime) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] run];
    }
}

- (void)showTime {
    
    /*
     滑动的时候就会导致timer不准的情况
         2015-09-16 16:56:18.620 PCRunLoop[2179:149277] ==2015-09-16 08:56:18 +0000
         2015-09-16 16:56:20.094 PCRunLoop[2179:149277] ==2015-09-16 08:56:20 +0000
         2015-09-16 16:56:21.359 PCRunLoop[2179:149277] ==2015-09-16 08:56:21 +0000
         2015-09-16 16:56:21.446 PCRunLoop[2179:149277] ==2015-09-16 08:56:21 +0000
         2015-09-16 16:56:22.447 PCRunLoop[2179:149277] ==2015-09-16 08:56:22 +0000
         2015-09-16 16:56:23.447 PCRunLoop[2179:149277] ==2015-09-16 08:56:23 +0000
     */
    NSLog(@"===%@",[NSThread currentThread]);
    NSLog(@"==%@",[NSDate date]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
