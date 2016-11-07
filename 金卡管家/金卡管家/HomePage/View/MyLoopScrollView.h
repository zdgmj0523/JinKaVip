//
//  MyLoopScrollView.h
//  LoopScroll封装
//
//  Created by Sure on 15-8-27.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyLoopScrollView : UIView//遵守协议
//公开初始化方法 该方法可以接受一组图片 进行循环滚动显示
- (instancetype)initWithFrame:(CGRect)frame AndImages:(NSArray*)images;

//定义属性 用于接收传过来的图片数组
@property (nonatomic,strong)NSArray * picArr;

@end
