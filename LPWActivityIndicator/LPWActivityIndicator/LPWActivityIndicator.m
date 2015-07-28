//
//  LPWActivityIndicator.m
//  LPWActivityIndicator
//
//  Created by dong on 15-4-7.
//  Copyright (c) 2015年 LPW. All rights reserved.
//

#import "LPWActivityIndicator.h"
#define ANIMATION_DURATION_SECS 0.5


@implementation LPWActivityIndicator
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setupViewLayout:self.frame];
}
-(instancetype)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {
        [self setupViewLayout:frame];
    }
    return self;
}

#pragma mark ****** 布局试图 ****

-(void)setupViewLayout:(CGRect)frame
{
    _stepNumber = 0;
    _isAnimating = NO;
    self.hidesWhenStopped = YES;
    self.color = [UIColor colorWithRed:241/255.0f green:196/255.0f blue:15/255.0f alpha:1.0];
    _dotRadius = frame.size.height <= frame.size.width?frame.size.height/12:frame.size.width/12;
    
    _firstPoint = CGRectMake(frame.size.width/4 -_dotRadius, frame.size.height/2 -_dotRadius,2*_dotRadius, 2*_dotRadius);
    _secondPoint = CGRectMake(frame.size.width/2-_dotRadius, frame.size.height/4-_dotRadius, 2*_dotRadius, 2*_dotRadius);
    _thirdPoint = CGRectMake(3*frame.size.width/4-_dotRadius, frame.size.height/2-_dotRadius, 2*_dotRadius, 2*_dotRadius);
    _fourthPoint = CGRectMake(frame.size.width/2-_dotRadius, 3*frame.size.height/4-_dotRadius, 2*_dotRadius, 2*_dotRadius);
    

    _firstDot = [CALayer layer];
    [_firstDot setMasksToBounds:YES];
    [_firstDot setBackgroundColor:[self.color CGColor]];
    
    [_firstDot setCornerRadius:_dotRadius];
    [_firstDot setBounds:CGRectMake(0.0f, 0.0f, _dotRadius*2, _dotRadius*2)];
    
    _firstDot.frame = _fourthPoint;
    //Second dot is the one that moves straight left and right
    _secondDot = [CALayer layer];
    [_secondDot setMasksToBounds:YES];
    [_secondDot setBackgroundColor:[self.color CGColor]];
    [_secondDot setCornerRadius:_dotRadius];
    [_secondDot setBounds:CGRectMake(0.0f, 0.0f, _dotRadius*2, _dotRadius*2)];
    _secondDot.frame = _firstPoint;
    
    //Third dot is the one that moves around all four positions clockwise
    _thirdDot = [CALayer layer];
    [_thirdDot setMasksToBounds:YES];
    [_thirdDot setBackgroundColor:[self.color CGColor]];
    [_thirdDot setCornerRadius:_dotRadius];
    [_thirdDot setBounds:CGRectMake(0.0f, 0.0f, _dotRadius*2, _dotRadius*2)];
    _thirdDot.frame = _thirdPoint;
    [[self layer]addSublayer:_firstDot];
    [[self layer]addSublayer:_secondDot];
    [[self layer]addSublayer:_thirdDot];
    self.layer.hidden = YES;
    
    CGRect labelRect = CGRectMake(self.center.x -12*_dotRadius, self.center.y+12*_dotRadius,24*_dotRadius, 24*_dotRadius);
    UILabel * loading = [[UILabel alloc]initWithFrame:labelRect];
    
    loading.text = @"loading......";
    loading.textAlignment = NSTextAlignmentCenter;
    [self addSubview:loading];
    
    
   
    
}

#pragma mark ==== animating 动画
- (void)activityIndicatorOfLPWStartAnimaing
{
    
    if (!_isAnimating) {
        _isAnimating = YES;
        self.layer.hidden = NO;
        _timer = [NSTimer scheduledTimerWithTimeInterval:ANIMATION_DURATION_SECS target:self selector:@selector(animateNextStep) userInfo:nil repeats:YES
                  ];    }
}
- (void)activityIndicatorOfLPWStopAnimaing
{
    _isAnimating = NO;
    
    if (self.hidesWhenStopped) {
        self.layer.hidden = YES;
        [_timer invalidate];
        _stepNumber = 0;
        _firstDot.frame = _fourthPoint;
        _secondDot.frame = _firstPoint;
        _thirdDot.frame = _thirdPoint;
    }
    
}

-(void)animateNextStep
{
    switch(self.stepNumber)
    {
        case 0:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            _firstDot.frame = _secondPoint;
            _thirdDot.frame = _fourthPoint;
            [CATransaction commit];
            break;
        case 1:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            _secondDot.frame = _thirdPoint;
            _thirdDot.frame = _firstPoint;
            [CATransaction commit];
            break;
        case 2:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            _firstDot.frame = _fourthPoint;
            _thirdDot.frame = _secondPoint;
            [CATransaction commit];
            break;
        case 3:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            _secondDot.frame = _firstPoint;
            _thirdDot.frame = _thirdPoint;
            [CATransaction commit];
            break;
        case 4:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            _firstDot.frame = _secondPoint;
            _thirdDot.frame = _fourthPoint;
            [CATransaction commit];
            _stepNumber = 0;
        default:
            break;
    }
    
    _stepNumber++;
}
- (BOOL)isAnimatingOfLpwactivityIndicator
{
    return _isAnimating;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
