


//NSScanner是一个类，用于在字符串中扫描指定的字符，尤其是把它们翻译/转换为数字和别的字符串。可以在创建NSScaner时指定它的string属性，然后scanner会按照你的要求从头到尾地扫描这个字符串的每个字符。
//创建一个Scanner
//NSScanner是一个类族， NSScanner是其中公开的一类。通常，可以用scannerWithString:或localizedScannerWithString:方法初始化一个scanner。这两个方法都返回一个scanner对象并用你传递的字符串参数初始化其string属性。刚创建时scanner对象指向字符串的开头。scanner方法开始扫描，比如scanInt:，scanDouble:，scanString:intoString:。如果你要想扫描多遍，通常需要使用while循环，
//例如如下代码所示：
//[cpp] view plaincopyprint?
//float aFloat;
//
//NSScanner *theScanner = [NSScanner scannerWithString:aString];
//
//while ([theScanner isAtEnd] == NO) {
//    
//    [theScanner scanFloat:&aFloat];
//    
//    // implementation continues...
//    
//}
//以上例子会循环的搜索字符串中的浮点值，并赋值给aFloat参数。这个时候isAtEnd便会紧接上一次搜索到的字符位置继续搜索看是否存在下一个浮点值，直至扫描结束。扫描动作的核心就是位置的变动。位置不停地在扫描中移动，直至结束扫描。
//另外，还可以通过setCaseSensitive:方法设置是否忽略大小写，默认是忽略。
//
//Scanner的使用
//扫描操作从上次扫描的位置开始，并且继续往后扫描直到指定的内容出现为止（如果有的话）。
//以字符串“137 small cases of bananas”为例，在扫描完一个整数之后，scanner的位置将变为3，也即数字后面的空格处。通常，你会继续扫描并跳过你不关心的字符。那么你可以用setScanLocation:方法跳过某几个字符（也可以用这个方法在发生某些错误后，重新开始扫描字符串的某部分）。如果你想跳过某种特殊的字符集中的字符时，可以使用setCharactersToBeSkipped:方法。scanner在任何扫描操作时会跳过空白字符之后才开始。但是当它找到一个可以扫描的字符时，它会用全部字符去和指定内容匹配。scanner默认情况下会忽略空白字符和换行符。注意，对于忽略字符，总是大小写敏感的。例如要忽略所有原音字母，你必须使用“AEIOUaeiou”，而不能仅仅是“AEIOU”或“aeiou”。
//如果你想获取当前位置的某个字符串的内容，可以使用scanUpToString:intoString:方法（如果你不想保留这些字符，可以传递一个NULL给第2个参数）。
//例如，以下列字符串为例：
//137 small cases of bananas
//
//下面的代码，可以从字符串中找出包装规格（small cases）和包装数量（137）。
//[cpp] view plaincopyprint?
//NSString *bananas = @"137 small cases of bananas";
//NSString *separatorString = @" of";
//NSScanner *aScanner = [NSScanner scannerWithString:bananas];
//NSInteger anInteger;
//[aScanner scanInteger:&anInteger];
//NSString *container;
//[aScanner scanUpToString:separatorString intoString:&container];
//查找字符串separatorString为“ of”关系重大。默认scanner会忽略空白字符，因此在数字137后面的空格被忽略。但是当scanner从空格后面的字符开始时，所有的字符都被加到了输出字符串中，一直到遇到搜索字符串（“of”）。
//如果搜索字符串是“of”（前面没空格），container的第一个值应该是“smallcases ”（后面有个空格）；如果搜索字符串是“ of”（前面有空格），则container的第1个值是“small cases”（后面无空格）。
//在扫描到指定字符串（搜索字符串）之后，scanner的位置指向了该字符串开始处。如果你想继续扫描该字符串之后的字符，必须先扫描指定字符串（搜索字符串）。下列代码演示了如何跳过搜索字串并取得产品类型。注意我们使用了substringFromIndex:，等同于继续扫描直到整个字符串的末尾。
//
//[cpp] view plaincopyprint?
//[aScanner scanString:separatorString intoString:NULL];
//NSString *product;
//product = [[aScanner string] substringFromIndex:[aScanner scanLocation]];
//// could also use:
//// product = [bananas substringFromIndex:[aScanner scanLocation]];
//示例：
//假设你有如下字符串：
//Product: Acme Potato Peeler; Cost: 0.98 73
//Product: Chef Pierre Pasta Fork; Cost: 0.75 19
//Product: Chef Pierre Colander; Cost: 1.27 2
//
//以下代码演示了读取产品名称和价格的操作（价格简单地读作一个float），跳过“Product:”和“Cost:"子串，以及分号。注意，因为scanner默认忽略空白字符和换行符，循环中没有指定对它们的处理（尤其对于读取末尾的整数而言，并不需要处理额外的空白字符）。
//[cpp] view plaincopyprint?
//NSString *string = @"Product: Acme Potato Peeler; Cost: 0.98 73\n\
//Product: Chef Pierre Pasta Fork; Cost: 0.75 19\n\
//Product: Chef Pierre Colander; Cost: 1.27 2\n";
//
//NSCharacterSet *semicolonSet;
//NSScanner *theScanner;
//
//NSString *PRODUCT = @"Product:";
//NSString *COST = @"Cost:";
//
//NSString *productName;
//float productCost;
//NSInteger productSold;
//
//semicolonSet = [NSCharacterSet characterSetWithCharactersInString:@";"];
//theScanner = [NSScanner scannerWithString:string];
//
//while ([theScanner isAtEnd] == NO)
//
//{
//    
//    if ([theScanner scanString:PRODUCT intoString:NULL] &&
//        
//        [theScanner scanUpToCharactersFromSet:semicolonSet
//         
//                                   intoString:&productName] &&
//        
//        [theScanner scanString:@";" intoString:NULL] &&
//        
//        [theScanner scanString:COST intoString:NULL] &&
//        
//        [theScanner scanFloat:&productCost] &&
//        
//        [theScanner scanInteger:&productSold])
//        
//    {
//        
//        NSLog(@"Sales of %@: $%1.2f", productName, productCost * productSold);
//        
//    }
//    
//}
//
//本地化
//Scanner支持本地化的扫描，可以指定语言和方言。NSScanner只在小数点分隔符上使用locale属性（以NSDecimalSeparator为key）。你可以用lcoalizedScannerWithString:创建指定locale的scanner，或者用setLocale:方法显示地指定scanner的locale属性。如果你不指定locale，scanner假定使用默认的locale。
//版权声明：本文为博主原创文章，未经博主允许不得转载。


//
//  NScanner的基本用法.m
//  NSCannerAndShaperChangeButton
//
//  Created by peng on 15/7/28.
//  Copyright © 2015年 peng. All rights reserved.
//

#import "NScanner的基本用法.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@implementation NScanner_____



- (UIColor *)getColor:(NSString *)hexColor
{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}




@end
