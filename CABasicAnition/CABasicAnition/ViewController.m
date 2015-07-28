//
//  ViewController.m
//  CABasicAnition
//
//  Created by peng on 15/7/27.
//  Copyright © 2015年 peng. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "RuntimeModel.h"
#import "TestModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    RuntimeModel * runModdel = [[RuntimeModel alloc]init];
    unsigned int cout = 0;
    
    
//    object_getIvar(runModdel, &cout);
//      Ivar * ivars = objc_getClassList( [RuntimeModel class], cout);
    
//    NSString * name = objc_getClass([runModdel class]);
    
    
    
    
    [self setClassTest];

    
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

@end
