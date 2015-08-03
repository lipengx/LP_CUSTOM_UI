//
//  ViewController.m
//  CustomCollectionLayout
//
//  Created by peng on 15/8/1.
//  Copyright © 2015年 peng. All rights reserved.
//

#import "ViewController.h"
#import <CoreGraphics/CoreGraphics.h>


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.imageView.backgroundColor = [UIColor redColor];
//    //load color image
//    UIImage *image = [UIImage imageNamed:@"1.jpg"];
//    //load mask image
//    UIImage *mask = [UIImage imageNamed:@"2.png"];
//    //convert mask to correct format
//    CGColorSpaceRef graySpace = CGColorSpaceCreateDeviceGray();
//    CGImageRef maskRef = CGImageCreateCopyWithColorSpace(mask.CGImage, graySpace);
//    CGColorSpaceRelease(graySpace);
//    
//    //combine images
//    CGImageRef resultRef = CGImageCreateWithMask(image.CGImage, mask.CGImage);
//    UIImage *result = [UIImage imageWithCGImage:mask.CGImage];
//    CGImageRelease(resultRef);
//    CGImageRelease(maskRef);
//    //display result
//    self.imageView.image = result;
    // Do any additional setup after loading the view, typically from a nib.
    
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    

    // Dispose of any resources that can be recreated.
}

@end
