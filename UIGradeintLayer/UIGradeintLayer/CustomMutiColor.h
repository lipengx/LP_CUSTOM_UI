//
//  CustomMutiColor.h
//  UIGradeintLayer
//
//  Created by peng on 15/7/30.
//  Copyright © 2015年 peng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomMutiColor : UIView
@property (nonatomic, assign) CGFloat          lineWidth;  // 圆的线宽
@property (nonatomic, assign) CFTimeInterval   sec;        // 秒
@property (nonatomic, assign) CGFloat          percent;    // 百分比
@property (nonatomic, strong) CAShapeLayer *circleLayer;

@property (nonatomic, strong) NSArray         *colors;     // 颜色组(CGColor)

- (void)startAnimation;
- (void)endAnimation;
@end
