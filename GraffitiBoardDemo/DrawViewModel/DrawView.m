//
//  DrawView.m
//  Property
//
//  Created by rp.wang on 2018/6/19.
//  Copyright © 2018年 rp.wang. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

// MARK: - 初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        //-----------------------
        [self CreateOperationview];

        //-----------------------
        [self CreateGraffitiBoardView];
        
    }
    return  self;
}

// MARK: - 清除按钮
-(void)CreateOperationview
{
    NSArray *ImgList = @[@"shut_down",@"pencil",@"Draw_Undo",@"Draw_eraser",@"wancheng"];
    
    for(int i = 0;i<ImgList.count;i++)
    {
        //-----------------------
        UIView *Operationview = [[UIView alloc]initWithFrame:CGRectMake(i * (self.frame.size.width / ImgList.count) , 0, self.frame.size.width / ImgList.count, 55)];
        [self addSubview:Operationview];
        
        //-----------------------
        UIImageView *OperationImg = [[UIImageView alloc]initWithFrame:CGRectMake(Operationview.frame.size.width / 2 - 15, Operationview.frame.size.height / 2 - 15, 30, 30)];
        [Operationview addSubview:OperationImg];
        OperationImg.image = [UIImage imageNamed:ImgList[i]];
       
        
        //-----------------------
        UIButton *OperationBtn = [[UIButton alloc]initWithFrame:Operationview.bounds];
        [Operationview addSubview:OperationBtn];
        OperationBtn.tag = 100 + i;
        [OperationBtn addTarget:self action:@selector(TouchOperationBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
}

// MARK: - 按钮点击相关
-(void)TouchOperationBtn:(UIButton *)Btntag
{
    switch (Btntag.tag) {
        case 100:
        {
            [_GraffitiView clean];
        }
            break;
        case 101:
        {
            [_GraffitiView openpencil];
           
        }
            break;
        case 102:
        {
            [_GraffitiView undo];
        }
            break;
        case 103:
        {
            [_GraffitiView eraser];
        }
            break;
        case 104:
        {
            UIImage *photo = [_GraffitiView save];
            if(self.drowblocks)
            {
                self.drowblocks(photo);
            }
            //保存到相册
            UIImageWriteToSavedPhotosAlbum(photo, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
        }
        default:
            break;
    }
}

// MARK: - 保存图片的回调
- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *message = @"";
    if (!error) {
        message = @"成功保存到相册";
    }else{
        message = [error description];
    }
    NSLog(@"message is %@",message);
}


// MARK: - 涂鸦板
-(void)CreateGraffitiBoardView
{
    _GraffitiView = [[GraffitiBoardView alloc]initWithFrame:CGRectMake(0, 55,self.frame.size.width , self.frame.size.height - 55)];
    _GraffitiView.backgroundColor = [UIColor colorWithRed:((float)((0xf0f0f0 & 0xFF0000) >> 16))/255.0f green:((float)((0xf0f0f0 & 0xFF00) >> 8))/255.0f blue:((float)(0xf0f0f0 & 0xFF))/255.0f alpha:1.0f];
    _GraffitiView.lineColor = [UIColor colorWithRed:((float)((0x1b1b1b & 0xFF0000) >> 16))/255.0f green:((float)((0x1b1b1b & 0xFF00) >> 8))/255.0f blue:((float)(0x1b1b1b & 0xFF))/255.0f alpha:1.0f];
    _GraffitiView.lineWidth = 5.f;
    [self addSubview:_GraffitiView];
}

// MARK: - 显示涂鸦板
-(void)showDrawView
{
    //防止Block循环引用
    __weak typeof (self) weakSelf = self;
  
    [weakSelf setHidden:NO];
    
    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.alpha = 0;
    [UIView animateWithDuration:.35 animations:^{
        weakSelf.alpha = 1;
        weakSelf.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

// MARK: - 隐藏涂鸦板
-(void)hiddenDrawView
{
    [_GraffitiView clean];
    
    //防止Block循环引用
    __weak typeof (self) weakSelf = self;
    [UIView animateWithDuration:.35 animations:^{
        weakSelf.transform = CGAffineTransformMakeScale(1.3, 1.3);
        weakSelf.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [weakSelf setHidden:YES];
            
        }
    }];
    
}

@end
