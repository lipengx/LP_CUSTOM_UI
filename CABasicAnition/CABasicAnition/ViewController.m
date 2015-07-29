//
//  ViewController.m
//  CABasicAnition
//
//  Created by peng on 15/7/27.
//  Copyright © 2015年 peng. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/NSObjCRuntime.h>
#import "RuntimeModel.h"
#import "TestModel.h"
@interface ViewController ()
@property (nonatomic,strong)CAShapeLayer * shapeLayer;
@property (nonatomic,strong)UIView * maskView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //
    //
    //    RuntimeModel * runModdel = [[RuntimeModel alloc]init];
    //    unsigned int cout = 0;
    //
    ////
    ////    object_getIvar(runModdel, &cout);
    ////      Ivar * ivars = objc_getClassList( [RuntimeModel class], cout);
    ////
    ////    NSString * name = objc_getClass([runModdel class]);
    //
    //
    //
    //    [self setClassTest];
    self.maskView = [[UIView alloc]initWithFrame:CGRectMake(10, 300, 100, 100)];
    //    self.maskView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.maskView];
    
    
    [self basicAnimation];
    //    [self basicAnimationScale];
    [self CABasicAnimationContents];
    [self CABasicAnimationShadow];
    [self moveX];
//    [self rotatation];
    
    
    
    
}


- (void)rotatation
{
//    CATransform3D rotationTransform  = CATransform3DMakeRotation(0.8, 1, 1.5, 1.5);
    CATransform3D rotationTransform  = CATransform3DRotate(CATransform3DMakeRotation(1., 1., 1., 1.), 1., 1., 1., 2.0);
    
    CABasicAnimation* animation;
    
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    
    
    animation.toValue= [NSValue valueWithCATransform3D:rotationTransform];
    
    animation.duration= 2.;
    
    animation.autoreverses= NO;
    
    animation.cumulative= YES;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.repeatCount= INFINITY;
    [self.shapeLayer addAnimation:animation forKey:nil];
    
}

- (void)moveX
{

    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    
    animation.toValue=@(200.);
    
    animation.duration=3;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeBackwards;
    
    


}

- (void)CABasicAnimationShadow
{
    

    [self.shapeLayer setShadowOffset:CGSizeMake(2,2)];
    [self.shapeLayer setShadowOpacity:1];
    [self.shapeLayer setShadowColor:[UIColor grayColor].CGColor];
    [UIView animateWithDuration:1.0 animations:^{
        CABasicAnimation *_anim = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
        _anim.duration = 1.f;
        _anim.fromValue = [NSValue valueWithCGSize:CGSizeMake(0,0)];
        _anim.toValue = [NSValue valueWithCGSize:CGSizeMake(3,30)];
        
        _anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        _anim.repeatCount = CGFLOAT_MAX;
        _anim.autoreverses = YES;
        
        [self.shapeLayer addAnimation:_anim forKey:nil];
    } completion:^(BOOL finished) {
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
        anim.duration = 1.f;
        anim.toValue = (id)[UIColor greenColor].CGColor;
        anim.fromValue =(id)[UIColor blackColor].CGColor;
        anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        anim.repeatCount = INFINITY;
        anim.autoreverses = YES;
        [self.shapeLayer addAnimation:anim forKey:nil];
    }];
    

    CABasicAnimation *_anim1 = [CABasicAnimation animationWithKeyPath:@"Opacity"];
    _anim1.duration = 1.f;
    _anim1.fromValue = [NSNumber numberWithFloat:1.0];
    _anim1.toValue = [NSNumber numberWithFloat: 0.1+ (rand() % 10) * 0.05];
    
    _anim1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    _anim1.repeatCount = INFINITY;
    _anim1.autoreverses = YES;
    
    [self.shapeLayer addAnimation:_anim1 forKey:nil];


//    self.shapeLayer.opacity = 0.1;

    
}
- (void)CABasicAnimationContents
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"contents"];
    anim.duration = 2.f;
    //    self.view.layer.contents setImage:<#(nonnull CIImage *)#>
    anim.fromValue = (id)[UIImage imageNamed:@"1"].CGImage;
    anim.toValue = (id)[UIImage imageNamed:@"2"].CGImage;
    anim.byValue  = (id)[UIImage imageNamed:@"3"].CGImage;
    //    anim.toValue = (id)[UIColor redColor].CGColor;
    //    anim.fromValue =  (id)[UIColor blackColor].CGColor;
    
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.repeatCount = INFINITY;
    anim.autoreverses = YES;
    
    [self.shapeLayer addAnimation:anim forKey:nil];
    
    
}


- (void)basicAnimationScale
{
    //#mark --- 缩放
    
    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    pulse.duration = 0.5 + (rand() % 10) * 0.05;
    pulse.repeatCount = INFINITY;
    pulse.autoreverses = YES;
    pulse.fromValue = [NSNumber numberWithFloat:.8];
    pulse.toValue = [NSNumber numberWithFloat:1.2];
    [self.maskView.layer addAnimation:pulse forKey:nil];
    
    //#mark --- 圆角
    
    CABasicAnimation *pulse1 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    pulse1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    pulse1.duration = 0.5 + (rand() % 10) * 0.05;
    pulse1.repeatCount = INFINITY;
    pulse1.autoreverses = YES;
    pulse1.fromValue = [NSNumber numberWithFloat:0.];
    pulse1.toValue = [NSNumber numberWithFloat:50];
    [self.maskView.layer addAnimation:pulse1 forKey:nil];
    
    //-----大小
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"bounds"];
    anim.duration = 1.f;
    anim.fromValue = [NSValue valueWithCGRect:CGRectMake(0,0,10,10)];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(10,10,150,150)];
    anim.byValue  = [NSValue valueWithCGRect:self.maskView.frame];
    //    anim.toValue = (id)[UIColor redColor].CGColor;
    //    anim.fromValue =  (id)[UIColor blackColor].CGColor;
    
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.repeatCount = 10;
    anim.autoreverses = YES;
    
    [self.maskView.layer addAnimation:anim forKey:nil];
    
}
- (void)basicAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    
    //掉落
    CAMediaTimingFunction * miting = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.frame = CGRectMake(100, 0, 100, 100);
//    _shapeLayer.backgroundColor = [UIColor redColor].CGColor;
    [animation setFromValue:@(0.0)];
    [animation setToValue:@300.0];
    [animation setDuration:3.0];
    animation.timingFunction = miting;
    animation.speed +=1;
    //    [_shapeLayer setPosition:CGPointMake(100, 300)];
    animation.repeatCount = INFINITY;
    //    [animation setTimeOffset:100.0];
    
    
    //旋转
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    [animation2 setFromValue:@(0.0)];
    [animation2 setToValue:@(2*M_PI)];
    [animation2 setDuration:3.0];
    //    [_shapeLayer setPosition:CGPointMake(100, 300)];
    animation2.repeatCount = INFINITY;
    
    
    
    CABasicAnimation *animation3=[CABasicAnimation animationWithKeyPath:@"transform.translation"];
    
    animation3.toValue=[NSValue valueWithCGPoint:CGPointMake(200, 400)];
    
    animation3.removedOnCompletion=YES;
    animation3.duration = 2.;
//    animation3.fillMode=kCAFillModeForwards;
    animation3.repeatCount = INFINITY;
//    [self.shapeLayer addAnimation:animation2 forKey:@"transform.translation"];
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.animations = @[animation,animation2,animation];
    group.duration =10.0;
    group.repeatCount = INFINITY;
    [self.shapeLayer addAnimation:group forKey:nil];
    //    [self.shapeLayer addAnimation:animation2 forKey:nil];
    [self.view.layer addSublayer:self.shapeLayer];
    
    
}
int cfunction(id self, SEL _cmd, NSString *str)
{
    
    NSLog(@"%@",str);
    return 10;
}
- (void) setClassTest

{
    
    RuntimeModel *obj = [RuntimeModel new];
    //    [obj runTest];
    Class aClass = object_setClass(obj, [TestModel class]);
    //obj 对象的类被更改了    swap the isa to an isa
    NSLog(@"aClass:%@",NSStringFromClass(aClass));
    
    NSLog(@"obj class:%@",NSStringFromClass([obj class]));
    
    NSLog(@" RuntimeModel class = %@",NSStringFromClass([RuntimeModel class]));
    //    [obj runTest];
    
    
    class_addMethod([TestModel class], @selector(addClassMethodTest:),(IMP)cfunction, "i@:@");
    if ([obj respondsToSelector:@selector(addClassMethodTest:)]) {
        
        NSLog(@"Yes, instance respondsToSelector:@selector(addClassMethodTest)");
        //        [self addClassMethodTest:@"aaa"];
        
    } else
        
    {
        
        NSLog(@"Sorry!添加 方法");
        
    }
    
    
}


- (void)addClassMethodTest:(NSString * )str
{
    
    
    NSLog(@"增加一个类方法 === %@",str);
    
}
//- (void)basicAnimation


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



+(CABasicAnimation *)opacityForever_Animation:(float)time //永久闪烁的动画

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    
    animation.toValue=[NSNumber numberWithFloat:0.0];
    
    animation.autoreverses=YES;
    
    animation.duration=time;
    
    animation.repeatCount=FLT_MAX;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}



+(CABasicAnimation *)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time; //有闪烁次数的动画

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    
    animation.toValue=[NSNumber numberWithFloat:0.4];
    
    animation.repeatCount=repeatTimes;
    
    animation.duration=time;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    animation.autoreverses=YES;
    
    return  animation;
    
}



+(CABasicAnimation *)moveX:(float)time X:(NSNumber *)x //横向移动

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    
    animation.toValue=x;
    
    animation.duration=time;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}



+(CABasicAnimation *)moveY:(float)time Y:(NSNumber *)y //纵向移动

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    animation.toValue=y;
    
    animation.duration=time;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}



+(CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time Rep:(float)repeatTimes //缩放

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.fromValue=orginMultiple;
    
    animation.toValue=Multiple;
    
    animation.duration=time;
    
    animation.autoreverses=YES;
    
    animation.repeatCount=repeatTimes;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}



+(CAAnimationGroup *)groupAnimation:(NSArray *)animationAry durTimes:(float)time Rep:(float)repeatTimes //组合动画

{
    
    CAAnimationGroup *animation=[CAAnimationGroup animation];
    
    animation.animations=animationAry;
    
    animation.duration=time;
    
    animation.repeatCount=repeatTimes;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}



+(CAKeyframeAnimation *)keyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes //路径动画

{
    
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.path=path;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    animation.autoreverses=NO;
    
    animation.duration=time;
    
    animation.repeatCount=repeatTimes;
    
    return animation;
    
}



+(CABasicAnimation *)movepoint:(CGPoint )point //点移动

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation"];
    
    animation.toValue=[NSValue valueWithCGPoint:point];
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}



+(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount //旋转

{
    
    CATransform3D rotationTransform  = CATransform3DMakeRotation(degree, 0, 0,direction);
    
    CABasicAnimation* animation;
    
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    
    
    animation.toValue= [NSValue valueWithCATransform3D:rotationTransform];
    
    animation.duration= dur;
    
    animation.autoreverses= NO;
    
    animation.cumulative= YES;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.repeatCount= repeatCount; 
    
    animation.delegate= self;
    
    
    
    return animation;
    
}

@end
