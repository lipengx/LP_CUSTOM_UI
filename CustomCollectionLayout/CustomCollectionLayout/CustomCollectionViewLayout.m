


//
//  CustomCollectionViewLayout.m
//  CustomCollectionLayout
//
//  Created by peng on 15/8/1.
//  Copyright © 2015年 peng. All rights reserved.
//
/**
 layoutAttributesForElementsInRect:
 这是任何布局类中最重要的方法了，同时可能也是最容易让人迷惑的方法。collection view调用这个方法并传递一个自身坐标系统中的矩形过去。这个矩形代表了这个视图的可见矩形区域（也就是它的bounds），你需要准备好处理传给你的任何矩形。
 
 你的实现必须返回一个包含UICollectionViewLayoutAttributes对象的数组，为每一个cell包含这样的一个对象，supplementary view或decoration view在矩形区域内是可见的。UICollectionViewLayoutAttributes类包含了collection view内item的所有相关布局属性。默认情况下，这个类包含frame，center，size，transform3D，alpha，zIndex属性(properties)，和hidden特性(attributes)。如果你的布局想要控制其他视图的属性（比如，背景颜色），你可以建一个UICollectionViewLayoutAttributes的子类，然后加上你自己的属性。
 
 布局属性对象通过indexPath属性和他们对应的cell，supplementary view或者decoration view关联在一起。collection view为所有items从布局对象中请求到布局属性后，它将会实例化所有视图，并将对应的属性应用到每个视图上去。
 
 注意！这个方法涉及到所有类型的视图，也就是cell，supplementary views和decoration views。一个幼稚的实现可能会选择忽略传入的矩形，并且为collection view中的所有视图返回布局属性。在原型设计和开发布局阶段，这是一个有效的方法。但是，这将对性能产生非常坏的影响，特别是可见cell远少于所有cell数量的时候，collection view和布局对象将会为那些不可见的视图做额外不必要的工作。
 
 你的实现需要做这几步：
 
 
 1.创建 一个 nsmutablearray 数组来存放所有的布局属性
 2.确定index paths中哪些cells的frame完全或部分位于矩形中。这个计算需要你从collection view的数据源中取出你需要显示的数据。然后在循环中调用你实现的layoutAttributesForItemAtIndexPath:方法为每个index path创建并配置一个合适的布局属性对象，并将每个对象添加到数组中。
 3.如果你的布局包含supplementary views（增补视图 header and footer ），计算矩形内可见supplementary view的index paths。在循环中调用你实现的layoutAttributesForSupplementaryViewOfKind:atIndexPath:，并且将这些对象加到数组中。通过为kind参数传递你选择的不同字符，你可以区分出不同种类的supplementary views（比如headers和footers）。当需要创建视图时，collection view会将kind字符传回到你的数据源。记住supplementary和decoration views的数量和种类完全由布局控制。你不会受到headers和footers的限制。
 4.如果布局包含decoration views，计算矩形内可见decoration views的index paths。在循环中调用你实现的layoutAttributesForDecorationViewOfKind:atIndexPath:，并且将这些对象加到数组中。
 
 5.返回数组。
 */

#import "CustomCollectionViewLayout.h"

@implementation CustomCollectionViewLayout



//-(nullable NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
//{
//
//    NSMutableArray * laoutAttibutes = [NSMutableArray array];
//    
////    NSArray *visibleIndexPaths = [self indexPathsOfItemsInRect:rect];
//    
//    
//    return nil;
//
//}

//-(CGSize)collectionViewContentSize
//{
//
//    CGFloat contenWith = self.collectionViewContentSize.width;
//    
//    
//    
//    CGFloat contentHight =
//    
//
//}



















@end
