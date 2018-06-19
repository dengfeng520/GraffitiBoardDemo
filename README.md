# GraffitiBoardDemo

>画板demo,实现撤销，橡皮擦，保存到相册等功能

#####效果图：

![](https://github.com/dengfeng520/GraffitiBoardDemo/blob/master/GraffitiBoardDemo.gif)

#####使用方法：
```
@property (strong, nonatomic) DrawView *drowview;

_drowview = [[DrawView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_drowview];
```


#####同时，demo中也提供了显示和隐藏动画；

```

//hidden
 [_drowview  hiddenDrawView];
 //show
 [_drowview  showDrawView];
 
```
