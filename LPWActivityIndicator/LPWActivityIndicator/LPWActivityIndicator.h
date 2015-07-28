//
//  LPWActivityIndicator.h
//  LPWActivityIndicator
//
//  Created by dong on 15-4-7.
//  Copyright (c) 2015年 LPW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface LPWActivityIndicator : UIView

@property (nonatomic)BOOL hidesWhenStopped;
@property (nonatomic,strong) UIColor * color;

@property (nonatomic,assign)float dotRadius;
@property (nonatomic, assign) int stepNumber;
@property (nonatomic,assign)BOOL isAnimating;
@property (nonatomic,strong)NSTimer * timer;

@property (nonatomic, assign) CGRect firstPoint, secondPoint, thirdPoint, fourthPoint;
@property (nonatomic, strong) CALayer *firstDot, *secondDot, *thirdDot;


- (void)activityIndicatorOfLPWStartAnimaing;
- (void)activityIndicatorOfLPWStopAnimaing;
- (BOOL)isAnimatingOfLpwactivityIndicator;



@end
