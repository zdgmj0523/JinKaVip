//
//  HomePageViewController.m
//  金卡管家
//
//  Created by Scott on 2016/11/3.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageCollectionCell.h"
#import "MyLoopScrollView.h"
#import "CollectionViewController.h"
@interface HomePageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) NSArray * titleArr;
@property(nonatomic,strong) NSArray * imageArr;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetTheNavigationBar];
    [self createScrollView];
    [self createHomePageCollectionView];
}
#pragma mark 设置导航栏
-(void)SetTheNavigationBar{
    self.title = @"首页";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
//    self.view.backgroundColor = [UIColor yellowColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"icon_03"]forBarMetrics:UIBarMetricsDefault];
}
#pragma mark 设置滚动视图
-(void)createScrollView{
    NSArray * picArray = @[@"banner3",@"banner",@"banner2",@"banner3",@"banner"];
    MyLoopScrollView * myLoop = [[MyLoopScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHTSIZE(180)) AndImages:picArray];
    
    [self.view addSubview:myLoop];
    
}
#pragma mark 设置collectionview
-(void)createHomePageCollectionView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _titleArr = @[@"当面收款",@"快速提款",@"转账",@"信用卡还款",@"交易查询",@"信用卡办理"];
    _imageArr = @[@"btn_dmsk",@"icon_08",@"icon_10",@"icon_26",@"icon_23",@"icon_29"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 滚动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    UICollectionView * collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, HEIGHTSIZE(180), WIDTH, (WIDTH/3)*2) collectionViewLayout:flowLayout];
    collection.backgroundColor = [UIColor lightGrayColor];
    collection.delegate = self;
    collection.dataSource = self;
    collection.scrollEnabled = NO;
    [self.view addSubview:collection];
    [collection registerClass:[HomePageCollectionCell class] forCellWithReuseIdentifier:@"CELL"];
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomePageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    cell.headImageView.image = [UIImage imageNamed:_imageArr[indexPath.row]];
    cell.nameLabel.text = _titleArr[indexPath.row];
    return cell;
};

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%d",indexPath.row+1);
    if (indexPath.row == 0) {
        CollectionViewController * collection = [[CollectionViewController alloc]init];
        [self.navigationController pushViewController:collection animated:YES];
    }
}
//修改Item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  CGSizeMake(WIDTH/3 -0.5, WIDTH/3 -1);
}
//设置水平间距与竖直间距 默认为10
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.2f;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1.0f;
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
