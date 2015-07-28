//
//  ChangeButtonView.m
//  NSCannerAndShaperChangeButton
//
//  Created by peng on 15/7/28.
//  Copyright © 2015年 peng. All rights reserved.
//

#import "ChangeButtonView.h"
//枚举值的使用
typedef enum
{
test,
test2
}lp;

/*
 *  oc、 枚举值  button 的旋转状态判定
 */
//typedef NS_ENUM(NSInteger,timingStatus)
//{
//
//    mmmaterialdesignspinnerstroke = 0,
//    mmmaterialdesignspinnerrotation = 1
//    
//    
//};
static NSString *kMMRingStrokeAnimationKey = @"mmmaterialdesignspinner.stroke";
static NSString *kMMRingRotationAnimationKey = @"mmmaterialdesignspinner.rotation";
@interface ChangeButtonView()


@property (nonatomic,readonly)CAShapeLayer * progressLayer;
@property (nonatomic)BOOL isAnimating;
@end
@implementation ChangeButtonView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
        
        
    }
    return self;
}
-(void)setTintColor:(UIColor * __nullable)tintColor
{
[self tintColorDidChange];
}

- (void)initialize

{
    self.layer.backgroundColor = [UIColor greenColor].CGColor;
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = CGRectMake(10, 10, 40, 40);
//    _progressLayer.position = CGPointMake(100, 100);
//    _progressLayer.backgroundColor = [UIColor blueColor].CGColor;
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    _progressLayer.strokeColor = [UIColor redColor].CGColor;
    _progressLayer.masksToBounds = YES;
    _progressLayer.cornerRadius = 20.0;
    _progressLayer.lineWidth = 2.0f;
    _timingFuncthion = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    UIBezierPath * bezier = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 40, 40)];
    
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGFloat radius = MIN(CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds) / 2) - self.progressLayer.lineWidth / 2;
    CGFloat startAngle = (CGFloat)(0);
    
    CGFloat endAngle = (CGFloat)(2*M_PI);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    _progressLayer.path = bezier.CGPath;
    
    
    
    
    [self.layer addSublayer:_progressLayer];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(resetAnimations) name:UIApplicationDidBecomeActiveNotification object:nil];
    
}
-(void)dealloc
{
       [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
}
- (void)resetAnimations {
    // If the app goes to the background, returning it to the foreground causes the animation to stop (even though it's not explicitly stopped by our code). Resetting the animation seems to kick it back into gear.
    if (self.isAnimating) {
        [self stopAnimating];
        [self startAnimating];
    }
}

- (void)tintColorDidChange
{
// self.progressLayer.strokeColor = self.tintColor.CGColor;
}
- (void)setAnimating:(BOOL)animate {
    (animate ? [self startAnimating] : [self stopAnimating]);
}
#pragma mark - Private

- (void)updatePath {
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGFloat radius = MIN(CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds) / 2) - self.progressLayer.lineWidth / 2;
    CGFloat startAngle = (CGFloat)(0);
    
    CGFloat endAngle = (CGFloat)(2*M_PI);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
//    UIBezierPath * path2 = [UIBezierPath bezierPathWithRoundedRect:self.progressLayer.bounds cornerRadius:radius];

    self.progressLayer.path = path.CGPath;

    
    self.progressLayer.strokeStart = 0.f;
    self.progressLayer.strokeEnd = 1.f;

}
-(void)startAnimating
{
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.duration = 4.f;
    animation.fromValue = @(0.f);
    animation.toValue = @(2*M_PI);
    animation.repeatCount = INFINITY;
    [self.progressLayer addAnimation:animation forKey:kMMRingRotationAnimationKey];
    
    CABasicAnimation *headAnimation = [CABasicAnimation animation];
    headAnimation.keyPath = @"strokeStart";
    headAnimation.duration = 1.f;
    headAnimation.fromValue = @(0.f);
    headAnimation.toValue = @(0.25f);
    headAnimation.timingFunction = self.timingFuncthion;
    
    CABasicAnimation *tailAnimation = [CABasicAnimation animation];
    tailAnimation.keyPath = @"strokeEnd";
    tailAnimation.duration = 1.f;
    tailAnimation.fromValue = @(0.f);
    tailAnimation.toValue = @(1.f);
    tailAnimation.timingFunction = self.timingFuncthion;
    
    
    CABasicAnimation *endHeadAnimation = [CABasicAnimation animation];
    endHeadAnimation.keyPath = @"strokeStart";
    endHeadAnimation.beginTime = 1.f;
    endHeadAnimation.duration = 0.5f;
    endHeadAnimation.fromValue = @(0.25f);
    endHeadAnimation.toValue = @(1.f);
    endHeadAnimation.timingFunction = self.timingFuncthion;
    
    CABasicAnimation *endTailAnimation = [CABasicAnimation animation];
    endTailAnimation.keyPath = @"strokeEnd";
    endTailAnimation.beginTime = 1.f;
    endTailAnimation.duration = 0.5f;
    endTailAnimation.fromValue = @(1.f);
    endTailAnimation.toValue = @(1.f);
    endTailAnimation.timingFunction = self.timingFuncthion;
    
    CAAnimationGroup *animations = [CAAnimationGroup animation];
    [animations setDuration:1.5f];
    [animations setAnimations:@[headAnimation, tailAnimation, endHeadAnimation, endTailAnimation]];
    animations.repeatCount = INFINITY;
    [self.progressLayer addAnimation:animations forKey:kMMRingStrokeAnimationKey];
//    [self updatePath];
    
    self.isAnimating = true;
    
    if (self.isHiddenWhenStop) {
        self.hidden = NO;
    }
}
- (void)stopAnimating {
    if (!self.isAnimating)
        return;
    
    [self.progressLayer removeAnimationForKey:kMMRingRotationAnimationKey];
    [self.progressLayer removeAnimationForKey:kMMRingStrokeAnimationKey];
    self.isAnimating = false;
    
    if (self.isHiddenWhenStop) {
        self.hidden = YES;
    }
}

@end
