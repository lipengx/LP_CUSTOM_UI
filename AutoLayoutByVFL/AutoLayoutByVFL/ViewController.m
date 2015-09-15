//
//  ViewController.m
//  AutoLayoutByVFL
//
//  Created by Puzhi Li on 15/4/17.
//  Copyright (c) 2015年 Puzhi Li. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    NSArray * array = [NSLayoutConstraint constraintsWithVisualFormat:<#(NSString *)#> options:<#(NSLayoutFormatOptions)#> metrics:<#(NSDictionary *)#> views:<#(NSDictionary *)#> ]
    UIImageView* logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple.jpg"]];
    logoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:logoImageView];
    
    UIScrollView* scrollView = [UIScrollView new];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
//    scrollView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:scrollView];
    
    //水平方向上，logoImageView左侧与父视图左侧对齐，logoImageView右侧与父视图右侧对齐
    NSArray* hConstraintArray = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[logoImageView]|" options:0 metrics:nil views:@{@"logoImageView": logoImageView}];
    [NSLayoutConstraint activateConstraints:hConstraintArray];
    
    //垂直方向上，logoImageView顶部与父视图顶部对齐，logoImageView底部与scrollView顶部对齐，scrollView底部与父视图底部对齐
    NSArray* vConstraintArray = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[logoImageView][scrollView]|" options:0 metrics:nil views:@{@"logoImageView": logoImageView, @"scrollView": scrollView}];
    [NSLayoutConstraint activateConstraints:vConstraintArray];
    
    //logoImageView高度为父视图高度一半
    NSLayoutConstraint* heightConstraint = [NSLayoutConstraint constraintWithItem:logoImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.5f constant:0.0f];
    heightConstraint.active = YES;
    
    //水平方向上，scrollView左侧与父视图左侧对齐，scrollView右侧与父视图右侧对齐
    NSArray* hScrollViewConstraintArray = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(scrollView)];
    [NSLayoutConstraint activateConstraints:hScrollViewConstraintArray];
    
    
    UILabel* nameLabel = [UILabel new];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    nameLabel.text = @"苹果公司";
    nameLabel.backgroundColor = [UIColor greenColor];
    [scrollView addSubview:nameLabel];
    
    UILabel* descriptionLabel = [UILabel new];
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    descriptionLabel.text = @"苹果公司（Apple Inc. ）是美国的一家高科技公司。由史蒂夫·乔布斯、斯蒂夫·沃兹尼亚克和罗·韦恩(Ron Wayne)等三人于1976年4月1日创立，并命名为美国苹果电脑公司（Apple Computer Inc. ）， 2007年1月9日更名为苹果公司，总部位于加利福尼亚州的库比蒂诺。\n苹果公司创立之初主要开发和销售的个人电脑，截至2014年致力于设计、开发和销售消费电子、计算机软件、在线服务和个人计算机。苹果的Apple II于1970年代助长了个人电脑革命，其后的Macintosh接力于1980年代持续发展。该公司硬件产品主要是Mac电脑系列、iPod媒体播放器、iPhone智能手机和iPad平板电脑；在线服务包括iCloud、iTunes Store和App Store；消费软件包括OS X和iOS操作系统、iTunes多媒体浏览器、Safari网络浏览器，还有iLife和iWork创意和生产力套件。苹果公司在高科技企业中以创新而闻名世界。\n苹果公司1980年12月12日公开招股上市，2012年创下6235亿美元的市值记录，截至2014年6月，苹果公司已经连续三年成为全球市值最大公司。苹果公司在2014年世界500强排行榜中排名第15名。2013年9月30日，在宏盟集团的“全球最佳品牌”报告中，苹果公司超过可口可乐成为世界最有价值品牌。2014年，苹果品牌超越谷歌（Google），成为世界最具价值品牌 。";
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.backgroundColor = [UIColor yellowColor];
    [scrollView addSubview:descriptionLabel];
    
    
    //水平方向上，nameLabel左侧与父视图左侧对齐，nameLabel右侧与父视图右侧对齐，nameLabel宽度与logoImageView宽度相同
    NSArray* hNameLabelConstraintArray = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[nameLabel(==logoImageView)]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(nameLabel, logoImageView)];
    [NSLayoutConstraint activateConstraints:hNameLabelConstraintArray];

    //水平方向上，descriptionLabel左侧与父视图左侧对齐，descriptionLabel右侧与父视图右侧对齐，descriptionLabel宽度与logoImageView宽度相同
    NSArray* hDescriptionLabelConstraintArray = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[descriptionLabel(==logoImageView)]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(descriptionLabel, logoImageView)];
    [NSLayoutConstraint activateConstraints:hDescriptionLabelConstraintArray];

    //垂直方向上，nameLabel顶部与父视图顶部对齐，nameLabel高度为20，nameLabel底部与descriptionLabel顶部对齐，descriptionLabel底部与父视图底部对齐
    NSArray* vLabelConstraintArray = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[nameLabel(20)][descriptionLabel]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(nameLabel, descriptionLabel)];
    [NSLayoutConstraint activateConstraints:vLabelConstraintArray];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
