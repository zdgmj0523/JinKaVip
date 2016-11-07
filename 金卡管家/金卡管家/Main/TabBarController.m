//
//  TabBarController.m
//  
//
//  Created by Scott on 2016/11/3.
//
//

#import "TabBarController.h"
#import "HomePageViewController.h"
#import "LifeServiceViewController.h"
#import "MineViewController.h"
@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    HomePageViewController * HomePage = [[HomePageViewController alloc]init];
    [self setUpChildViewController:HomePage title:@"首页" image:@"shouye" selectimage:@"shouyeliang"];
    
    LifeServiceViewController * LifeService = [[LifeServiceViewController alloc]init];
    [self setUpChildViewController:LifeService title:@"生活服务" image:@"shenghuofuwu" selectimage:@"shenghuofuwuliang"];
    
    MineViewController * mine = [[MineViewController alloc]init];
    [self setUpChildViewController:mine title:@"我的管家" image:@"wodeguanjia" selectimage:@"wodeguanjialiang"];
    
    // Do any additional setup after loading the view.
}

-(void)setUpChildViewController:(UIViewController *)childView title:(NSString *)title image:(NSString *)imageName selectimage:(NSString *)selectImageName{
    childView.tabBarItem.title = title;
    childView.tabBarItem.image = [UIImage imageNamed:imageName];
    childView.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:childView];
    [self addChildViewController:nav];
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
