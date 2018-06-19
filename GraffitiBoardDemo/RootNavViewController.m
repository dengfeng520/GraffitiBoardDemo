//
//  RootNavViewController.m
//  GraffitiBoardDemo
//
//  Created by rp.wang on 2018/6/19.
//  Copyright © 2018年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import "RootNavViewController.h"


@interface RootNavViewController ()

@end

@implementation RootNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIColor *lbucolor = [UIColor colorWithRed:((float)((0x3688ff & 0xFF0000) >> 16))/255.0f green:((float)((0x3688ff & 0xFF00) >> 8))/255.0f blue:((float)(0x3688ff & 0xFF))/255.0f alpha:1.0f];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:lbucolor,NSForegroundColorAttributeName, nil];
    self.navigationBar.titleTextAttributes = dict;
    self.navigationBar.translucent = NO;
    [self.navigationBar setTintColor:lbucolor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
