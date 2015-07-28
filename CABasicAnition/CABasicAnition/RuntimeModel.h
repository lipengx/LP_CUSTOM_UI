//
//  RuntimeModel.h
//  CABasicAnition
//
//  Created by peng on 15/7/27.
//  Copyright © 2015年 peng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeModel : NSObject
@property (nonatomic,assign) int idetifiter;
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSString * methodName;



- (void)runTest;

@end
