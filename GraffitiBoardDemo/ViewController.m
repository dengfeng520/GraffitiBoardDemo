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

///
@property (strong, nonatomic) DrawView *drowview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"GraffitiBoardDemo";
    
    _drowview = [[DrawView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_drowview];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
