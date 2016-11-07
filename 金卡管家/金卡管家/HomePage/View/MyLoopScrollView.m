//
//  MyLoopScrollView.m
//  LoopScroll封装
//
//  Created by Sure on 15-8-27.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "MyLoopScrollView.h"

@interface MyLoopScrollView ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIPageControl * pageControl;

@end

@implementation MyLoopScrollView

- (instancetype)initWithFrame:(CGRect)frame AndImages:(NSArray *)images{
    if (self = [super initWithFrame:frame]) {
        //接收图片数组
        self.picArr = images;
        
        UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        scrollView.tag = 1000;
        //关闭反弹效果
        scrollView.bounces = NO;
        //去除滚动条
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        //设置滚动视图所能显示的大小
        scrollView.contentSize = CGSizeMake(images.count * self.bounds.size.width, self.bounds.size.height);
        //分页属性
        scrollView.pagingEnabled = YES;
        //设置滚动视图偏移量
        scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
        //设置代理
        scrollView.delegate = self;
        
        [self addSubview:scrollView];
        
        for (int i = 0; i < images.count; i++) {
            UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake( i * self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
            
            imageView.image = [UIImage imageNamed:images[i]];
            
            [scrollView addSubview:imageView];
        }
        
        //创建UIPageControl 对象
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, HEIGHTSIZE(160), WIDTH, 50)];
        //可以通过方法自动判断所需大小
        CGSize size = [_pageControl sizeForNumberOfPages:5];
        _pageControl.frame = CGRectMake(0, 0, size.width, size.height);
        
        _pageControl.center = CGPointMake(WIDTH / 2, HEIGHTSIZE(160));
        
        _pageControl.numberOfPages = images.count-2; 
        _pageControl.currentPage = 0; //当前页
        
        //设置控件上原点的颜色
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        
        _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
        
        //添加值发生改变的事件
        [_pageControl addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:_pageControl];
        
    }
    return self;
}
- (void)pageChange:(UIPageControl*)page{
    //获得当前PageControl所在页数
    NSInteger currentPage = page.currentPage;//0 1 2 3 4
    
    //更改滚动视图偏移量即可
    UIScrollView * scrollView = (UIScrollView*)[self viewWithTag:1000];
    
    [scrollView scrollRectToVisible:CGRectMake(currentPage * WIDTH, 0, WIDTH, HEIGHT) animated:YES];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取当前页数
    NSInteger pages = scrollView.contentOffset.x / self.bounds.size.width;
    
    if (pages == 0) {
        //去倒数第二张 数组长度-2
        scrollView.contentOffset = CGPointMake((self.picArr.count - 2) * self.bounds.size.width, 0);
    }
    
    if (pages == self.picArr.count - 1) {
        scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
    }
    
    //获取当前页数 偏移量contentOffset/ WIDTH
    int page = scrollView.contentOffset.x / WIDTH-1;
    
    NSLog(@"%d",page);
    
    //与PageControl发生关联
    //设置PageControl当前所在页数即可
    _pageControl.currentPage = page;
    
    
}@end
