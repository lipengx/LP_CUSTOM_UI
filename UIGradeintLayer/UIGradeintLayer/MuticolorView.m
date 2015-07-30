



//
//  MuticolorView.m
//  UIGradeintLayer
//
//  Created by peng on 15/7/29.
//  Copyright © 2015年 peng. All rights reserved.
//

#import "MuticolorView.h"

@implementation MuticolorView
+ (Class)layerClass
{
    return [CAGradientLayer class];
}
-(nonnull instancetype)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {
        
        //生成一个彩色图片
        
        
        
       [self setupMulticolor];
//       shaper.mask =(CAGradientLayer *)[self setupMulticolor];
//        [self.layer addSublayer: shaper];
//        self.layer.mask = shaper;
        
    }
    return self;
}


- (CAGradientLayer *)setupMulticolor
{
 
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.frame;
    
    // 设置颜色线条分布的方向
    gradientLayer.startPoint = CGPointMake(0.0, 0.0);
    gradientLayer.endPoint = CGPointMake(1.0, 0.0);
    
    
    // 创建颜色数组
    NSMutableArray *colors = [NSMutableArray array];
    for (NSInteger hue = 0; hue <= 360; hue += 10) {
        [colors addObject:(id)[UIColor colorWithHue:1.0*hue/360.0 saturation:1.0 brightness:1.0 alpha:1.0].CGColor];
    }
    [gradientLayer setColors:[NSArray arrayWithArray:colors]];
   [self.layer addSublayer:gradientLayer];
CAShapeLayer * shaper = [self produceCircleShapeLayer];
    gradientLayer.mask = shaper;
    return gradientLayer;
//    [gradientLayer setColors:[NSArray arrayWithArray:colors]];
}
- (CAShapeLayer *)produceCircleShapeLayer
{
    // 生产出一个圆的路径
    CGPoint circleCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGFloat circleRadius = self.bounds.size.width/2.0 - 40;
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:circleCenter
                                                              radius:circleRadius
                                                          startAngle:M_PI
                                                            endAngle:-M_PI
                                                           clockwise:NO];
    
    // 生产出一个圆形路径的Layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = circlePath.CGPath;
    shapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    shapeLayer.fillColor = [[UIColor redColor] CGColor];
    shapeLayer.lineWidth = 10;
    
    // 可以设置出圆的完整性
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd = 1.0;
    
    return shapeLayer;
}


-(void)startAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 5;
    animation.repeatCount = MAXFLOAT;
    animation.fromValue = [NSNumber numberWithDouble:0];
    animation.toValue = [NSNumber numberWithDouble:M_PI*2];
    [self.layer addAnimation:animation forKey:@"transform"];
}
-(void)endAnimation
{

}
@end
