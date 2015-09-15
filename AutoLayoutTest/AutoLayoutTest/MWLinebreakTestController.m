//
//  MWLinebreakTestController.m
//  AutoLayoutTest
//
//  Created by evangel on 13-10-31星期四.
//  Copyright (c) 2013年 evangel. All rights reserved.
//

#import "MWLinebreakTestController.h"

@interface MWLinebreakTestController ()
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *messageL;
@property (weak, nonatomic) IBOutlet UIImageView *contentIV;
@property (weak, nonatomic) IBOutlet UILabel *commentL;
@property (weak, nonatomic) IBOutlet UILabel *timeL;
@property (weak, nonatomic) IBOutlet UIButton *doneBtn;

@property (unsafe_unretained, nonatomic) int testCnt;
@property (strong, nonatomic) NSMutableArray *dataArray;
@end

@implementation MWLinebreakTestController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	if(!_dataArray){
		_dataArray = [[NSMutableArray alloc] init];
	}
	[self configureData];
	[self runTest:Nil];
}

-(void)configureData{
	[_dataArray addObjectsFromArray:@[@{@"title":@"Default Title",@"message":@"Default Message",@"image":@"test.png",@"comment":@"0 comment",@"time":@"10-1-2013"},
									  @{@"title":@"Brad Cox title long long long long longuuuuuuuu fffffffffff",@"message":@"sadfaskdjklj lkjsdakj long ong ldksjf; kasoisduflasdfljasdfjasjdfsdfasfsd",@"image":@"Brad Cox.png",@"comment":@"100 comments",@"time":@"10-2-2013"},
									  @{@"title":@"Dennis Ritchie",@"message":@"sdkfjsakdjf 8203023r0293r0jidfj 0903riojj not long enough ????!",@"image":@"Dennis Ritchie.png",@"comment":@"2 comments",@"time":@"10-3-2013"},
									  @{@"title":@"Matthijs",@"message":@"message short with \nkduiejh\n nidiidii6",@"image":@"Matthijs.png",@"comment":@"10 comments",@"time":@"10-4-2013"},
									  @{@"title":@"Ray long long long xxxxxxx title xxxxxxxx 9384899499lksdjf;lajs",@"message":@"一名劫匪慌忙中窜上一辆车的后座，上车后发现主驾驶和副驾驶的一男一女疑惑的回头看着他。他立即拔出枪威胁到：赶快开车！甩掉后面的警车，否则老子一枪崩了你！！ 于是 副驾上的男人转过脸对那女的说：大姐，别慌！听我口令吧刚才的动作再练习一遍，挂一档，松离合，轻踩油门，走。。走哎。。。走。。哎。。哎。。对，走。点油门。哎。走。。哎。。哎。。走",@"image":@"Ray.png",@"comment":@"1000 comments",@"time":@"11-1-2013"}]];
}

- (IBAction)runTest:(id)sender {
	NSDictionary *data = [_dataArray objectAtIndex:_testCnt];
	NSString *title = [data objectForKey:@"title"];
	NSString *msg = [data objectForKey:@"message"];
	NSString *image = [data objectForKey:@"image"];
	NSString *comment = [data objectForKey:@"comment"];
	NSString *time = [data objectForKey:@"time"];
	
	//We don't need this anymore
	/*
	if([[UIDevice currentDevice].systemVersion floatValue]<7.0){
		CGSize titleS = [title sizeWithFont:[_titleL font]
						  constrainedToSize:CGSizeMake(280.0, CGFLOAT_MAX)
							  lineBreakMode:NSLineBreakByWordWrapping];
		_titleL.frame = CGRectMake(_titleL.frame.origin.x, _titleL.frame.origin.y,
									_titleL.frame.size.width, titleS.height);
		
		CGSize msgS = [msg sizeWithFont:[_messageL font]
						  constrainedToSize:CGSizeMake(280.0, CGFLOAT_MAX)
							  lineBreakMode:NSLineBreakByWordWrapping];
		_messageL.frame = CGRectMake(_messageL.frame.origin.x, _messageL.frame.origin.y,
								   _messageL.frame.size.width, msgS.height);
	}else{
		CGRect titleR = [title boundingRectWithSize:CGSizeMake(280.0, CGFLOAT_MAX)
											options:NSStringDrawingUsesLineFragmentOrigin
										 attributes:nil
											context:nil];
		CGRect msgR = [msg boundingRectWithSize:CGSizeMake(280.0, CGFLOAT_MAX)
										  options:NSStringDrawingUsesLineFragmentOrigin
									   attributes:nil
										  context:nil];
		_titleL.frame = CGRectMake(_titleL.frame.origin.x, _titleL.frame.origin.y, _titleL.frame.size.width, titleR.size.height);
		_messageL.frame = CGRectMake(_messageL.frame.origin.x, _messageL.frame.origin.y, _messageL.frame.size.width, msgR.size.height);
	}
	*/
	
	_titleL.text = title;
	_messageL.text = msg;
	_commentL.text = comment;
	_timeL.text = time;
	_contentIV.image = [UIImage imageNamed:image];
	
	_testCnt++;
	if(_testCnt >4)
		_testCnt = 0;
}

@end
