//
//  MWProgramatically.m
//  AutoLayoutTest
//
//  Created by evangel on 13-11-1星期五.
//  Copyright (c) 2013年 evangel. All rights reserved.
//

#import "MWProgramatically.h"

@interface MWProgramatically ()
@property (nonatomic,strong) UILabel *headerL;
@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,strong) UIView *boxV;
@property (nonatomic,strong) UIButton *doneBtn;
@property (nonatomic,strong) UIButton *backBtn;

@property (unsafe_unretained, nonatomic) int testCnt;
@property (strong, nonatomic) NSMutableArray *dataArray;
@end

@implementation MWProgramatically

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if(self){
		
	}
	return self;
}

//-(void)loadView{
//	[super loadView];
//	
//	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 568.0)];
//	[view setTranslatesAutoresizingMaskIntoConstraints:NO];
//	view.backgroundColor = [UIColor blueColor];
//	self.view = view;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor darkGrayColor];
	
	_boxV = [[UIView alloc] init];
	[_boxV setTranslatesAutoresizingMaskIntoConstraints:NO];
	_boxV.backgroundColor = [UIColor brownColor];
	[self.view addSubview:_boxV];
	
	_headerL = [[UILabel alloc] init];
	_headerL.backgroundColor = [UIColor purpleColor];
	_headerL.lineBreakMode = NSLineBreakByWordWrapping;
	_headerL.numberOfLines = 10;
	_headerL.font = [UIFont systemFontOfSize:15.0];
	_headerL.preferredMaxLayoutWidth = 270.0; //Notice! important, label not init from xib, must be set this property!
	[_headerL setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_boxV addSubview:_headerL];
	
	_imageV = [[UIImageView alloc] init];
	_imageV.backgroundColor = [UIColor yellowColor];
	_imageV.contentMode = UIViewContentModeScaleAspectFit;
	[_imageV setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_boxV addSubview:_imageV];
	
	_backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	[_backBtn setTitle:@"Back" forState:UIControlStateNormal];
	[_backBtn addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
	[_backBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_boxV addSubview:_backBtn];
	
	_doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	[_doneBtn setTitle:@"Test" forState:UIControlStateNormal];
	[_doneBtn addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
	[_doneBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_boxV addSubview:_doneBtn];
	
	//
	NSDictionary *dict1 = NSDictionaryOfVariableBindings(_boxV,_headerL,_imageV,_backBtn,_doneBtn);
	NSDictionary *metrics = @{@"hPadding":@5,@"vPadding":@5,@"imageEdge":@150.0};
	
	NSString *vfl = @"|-hPadding-[_boxV]-hPadding-|";
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl
																	  options:0
																	  metrics:metrics
																		views:dict1]];
	NSString *vfl0 = @"V:|-25-[_boxV]";
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl0
																	  options:0
																	  metrics:metrics
																		views:dict1]];
	NSString *vfl1 = @"|-hPadding-[_headerL]-hPadding-|";
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl1
																	  options:0
																	  metrics:metrics
																		views:dict1]];
	NSString *vfl2 = @"V:|-vPadding-[_headerL]";
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl2
																	  options:0
																	  metrics:metrics
																		views:dict1]];
	NSString *vfl3 = @"V:|-vPadding-[_headerL]-vPadding-[_imageV(imageEdge)]-vPadding-[_backBtn]-vPadding-|";
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl3
																	  options:NSLayoutFormatAlignAllLeft
																	  metrics:metrics
																		views:dict1]];
	NSString *vfl4 = @"|-hPadding-[_backBtn]-(>=50)-[_doneBtn]-hPadding-|";
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl4
																	  options:NSLayoutFormatAlignAllCenterY
																	  metrics:metrics
																		views:dict1]];
	if(!_dataArray)
		_dataArray = [[NSMutableArray alloc] init];
	
	[_dataArray addObjectsFromArray:@[@{@"title":@"Default Title",@"image":@"test.png"},
									  @{@"title":@"Brad Cox title long long long long long xxxxxxx093884",@"image":@"Brad Cox.png"},
									  @{@"title":@"Dennis Ritchie 111",@"image":@"Dennis Ritchie.png"},
									  @{@"title":@"Matthijs \n uuu \n123r23jljl;jfas lksdjflasfjlk\n\n ttttt9",@"image":@"Matthijs.png"},
									  @{@"title":@"Ray long long long xxxxxxx title xxxxxxxx 1234567111111111o ----- askdfjaksjfd9uo9 888880",@"image":@"Ray.png"}]];
	[self test:nil];
}

-(void)test:(id)sender{
	NSDictionary *data = [_dataArray objectAtIndex:_testCnt];
	NSString *title = [data objectForKey:@"title"];
	NSString *image = [data objectForKey:@"image"];
	
	_headerL.text = title;
	_imageV.image = [UIImage imageNamed:image];
	
	//We don't need this anymore
	/*
	if([[UIDevice currentDevice].systemVersion floatValue]<7.0){
		CGSize titleS = [title sizeWithFont:[_headerL font]
						   constrainedToSize:CGSizeMake(270.0, CGFLOAT_MAX)
							   lineBreakMode:NSLineBreakByWordWrapping];
		
		_headerL.frame = CGRectMake(_headerL.frame.origin.x, _headerL.frame.origin.y,
									_headerL.frame.size.width, titleS.height);
	}else{
		CGRect titleR = [title boundingRectWithSize:CGSizeMake(270.0, CGFLOAT_MAX)
											options:NSStringDrawingUsesLineFragmentOrigin
										 attributes:nil
											context:nil];
		headerL.frame = CGRectMake(_headerL.frame.origin.x, _headerL.frame.origin.y,
								   _headerL.frame.size.width, titleR.size.height);
	}
	*/
	_testCnt++;
	if(_testCnt >4)
		_testCnt = 0;
}

-(void)done:(id)sender{
	[self dismissViewControllerAnimated:YES completion:^{
		
	}];
}
@end
