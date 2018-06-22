//
//  GraffitiBoardView.h
//  Property
//
//  Created by rp.wang on 2018/6/19.
//  Copyright © 2018年 rp.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraffitiBoardView : UIView

///画笔颜色
@property(nonatomic, strong) UIColor * lineColor;
///画笔宽度
@property(nonatomic, assign) CGFloat lineWidth;
///铅笔颜色
@property (strong, nonatomic) UIColor *pencilColor;
///清除画板
- (void)clean;
///回退上一步
- (void)undo;
///橡皮擦
- (void)eraser;
///保存到相册
- (UIImage *)save;
///铅笔
-(void)openpencil;

@end

@interface MyUIBezierPath : UIBezierPath

@property(nonatomic,strong) UIColor *lineColor;

@end
