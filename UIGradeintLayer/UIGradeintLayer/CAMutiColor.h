//
//  CAMutiColor.h
//  UIGradeintLayer
//
//  Created by peng on 15/7/30.
//  Copyright © 2015年 peng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAMutiColor : UIView
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) CAMediaTimingFunction *timingFunction;
- (void)startAnimating;
@end
