//
//  ViewController.m
//  GraffitiBoardDemo
//
//  Created by rp.wang on 2018/6/19.
//  Copyright © 2018年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *hiddenorshow;
///
@property (strong, nonatomic) DrawView *drowview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"GraffitiBoardDemo";
   
   
    _drowview = [self drowview];
    _drowview.drowblocks = ^(UIImage *saveimg) {
        
        NSLog(@"==========%@",saveimg);
    };
    
    _hiddenorshow = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    UIImage *showImg = [UIImage imageNamed:@"drow_add"];
    UIImage *hiddenImg = [UIImage imageNamed:@"shut_down"];
    [_hiddenorshow setImage:showImg forState:UIControlStateNormal];
    [_hiddenorshow setImage:hiddenImg forState:UIControlStateSelected];
    [_hiddenorshow addTarget:self action:@selector(ClickConRightBarBtn:)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:_hiddenorshow];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)ClickConRightBarBtn:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if(sender.selected == YES)
    {
       [_drowview  hiddenDrawView];
        
    }else
    {
       [_drowview  showDrawView];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: - lazy
-(DrawView *)drowview
{
    if(_drowview == nil)
    {
        _drowview = [[DrawView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:_drowview];
    }
    return _drowview;
}

@end
