//
//  ChangeButtonView.h
//  NSCannerAndShaperChangeButton
//
//  Created by peng on 15/7/28.
//  Copyright © 2015年 peng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeButtonView : UIView


@property (nonatomic)CGFloat lineWith; /**<小菊花宽度*/
@property (nonatomic,getter=isHiddenWhenStop)BOOL hidesWhenStoped;/**<动画消失后是否隐藏*/
@property (nonatomic,strong)CAMediaTimingFunction * timingFuncthion;
@property (nonatomic,readonly)BOOL isAnimating;

- (void)setAnimating:(BOOL)animate; /**设置动画重新开始<*/
- (void)startAnimating; /**开始动画<*/
- (void)stopAnimating;/**结束动画<*/


@end
