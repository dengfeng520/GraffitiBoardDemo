//
//  DrawView.h
//  Property
//
//  Created by rp.wang on 2018/6/19.
//  Copyright © 2018年 rp.wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraffitiBoardView.h"

@interface DrawView : UIView
///保存图片成功后回调
typedef void(^Drawphotoblocks)(UIImage *saveimg);
///画板模块
@property (strong, nonatomic) GraffitiBoardView *GraffitiView;
///显示
-(void)showDrawView;
///隐藏
-(void)hiddenDrawView;
///
@property (nonatomic, copy) Drawphotoblocks drowblocks;

@end
