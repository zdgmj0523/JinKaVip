//
//  CollectionViewController.m
//  金卡管家
//
//  Created by Scott on 2016/11/4.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()
@property(nonatomic,copy)NSMutableString * numString;
@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收款";
    self.tabBarController.tabBar.hidden=YES;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_07"]];
    
    _numString = [[NSMutableString alloc]initWithString:@"0.00"];
    [self createNavigationBarBackItem];
    [self createThisPageUI];
    
    // Do any additional setup after loading the view.
}
-(void)createNavigationBarBackItem{
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"btn_02"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(WIDTHSIZE(10), 0, WIDTHSIZE(40), WIDTHSIZE(40));
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;

}
-(void)leftButtonClick:(UIButton *)button{
    self.tabBarController.tabBar.hidden=NO;
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 搭建界面
-(void)createThisPageUI{
    UILabel * RMBLable = [[UILabel alloc]initWithFrame:CGRectMake(WIDTHSIZE(25), HEIGHTSIZE(25), HEIGHTSIZE(55), HEIGHTSIZE(30))];
//    RMBLable.backgroundColor = [UIColor lightGrayColor];
    RMBLable.text = @"RMB";
    RMBLable.textColor = [UIColor blackColor];
    RMBLable.font = [UIFont fontWithName:@"ArialMT" size:WIDTHSIZE(20)];
    [self.view addSubview:RMBLable];
    
    UILabel * numLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHTSIZE(68), WIDTH, HEIGHTSIZE(80))];
    numLabel.tag = 11;
    numLabel.text = _numString;
    numLabel.font = [UIFont fontWithName:@"ArialMT" size:WIDTHSIZE(50)];
    numLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:numLabel];
    
    [self createCalculateNumKeyboard];
    
    //点击收款按钮
    UIButton * saveButoon = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [saveButoon setTitle:@"当面收款" forState:UIControlStateNormal];
    [saveButoon setBackgroundColor:[GeneralTool stringToColor:@"#b0b5b6"]];
    saveButoon.layer.cornerRadius = 5;
    [saveButoon setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    saveButoon.titleLabel.font = [UIFont systemFontOfSize:WIDTHSIZE(20)];
    saveButoon.frame = CGRectMake(WIDTHSIZE(20), HEIGHTSIZE(470), WIDTH-WIDTHSIZE(20)*2, HEIGHTSIZE(55));
    [self.view addSubview:saveButoon];
    
}
#pragma mark 创建数字键盘
-(void)createCalculateNumKeyboard{
    for (int i = 0; i<12; i++) {
        int h = i/3;
        int w = i%3;
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 21+i;
        if (i<9) {
            [button setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
            
        }else if(i==9){
            [button setTitle:@"c" forState:UIControlStateNormal];
        }else if (i==10){
            [button setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
        }else{
            [button setImage:[UIImage imageNamed:@"收款成功_03"] forState:UIControlStateNormal];
//            button.imageEdgeInsets = UIEdgeInsetsMake(7, 20, 3, 20);
        }
        button.titleEdgeInsets = UIEdgeInsetsMake(20, 20, 0, 20);
        button.imageEdgeInsets = UIEdgeInsetsMake(20, 20, 0, 20);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:@"ArialMT" size:WIDTHSIZE(30)];
        //        button.backgroundColor = [UIColor yellowColor];
        button.frame = CGRectMake(WIDTHSIZE(30)+((WIDTH-WIDTHSIZE(100))/3+WIDTHSIZE(18))*w, HEIGHTSIZE(160)+(HEIGHTSIZE(60)+1)*h, WIDTHSIZE((WIDTH-WIDTHSIZE(100))/3), HEIGHTSIZE(53));
        [button addTarget:self action:@selector(calculateKeyBoardButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(WIDTHSIZE(30)+((WIDTH-WIDTHSIZE(100))/3+WIDTHSIZE(18))*w, HEIGHTSIZE(160)+HEIGHTSIZE(60)*(h+1)+1*h, WIDTHSIZE((WIDTH-WIDTHSIZE(100))/3),1)];
        view.backgroundColor = [GeneralTool stringToColor:@"#d3d3d3"];
        [self.view addSubview:view];
    }
}
-(void)calculateKeyBoardButtonClick:(UIButton *)button{
    //显示小数点后两位
    if (button.tag < 30 || button.tag == 31) {
        if ([_numString hasPrefix:@"0"]||[_numString hasPrefix:@"."]) {
            [_numString deleteCharactersInRange:NSMakeRange(0, 1)];
        }
        [_numString appendString:button.titleLabel.text];
        [_numString deleteCharactersInRange:NSMakeRange(_numString.length-4, 1)];
        [_numString insertString:@"." atIndex:_numString.length-2];
    }else if(button.tag == 32){
        NSLog(@"%@",_numString);
        [_numString deleteCharactersInRange:NSMakeRange(_numString.length-1, 1)];
        [_numString deleteCharactersInRange:NSMakeRange(_numString.length-2, 1)];
        [_numString insertString:@"." atIndex:_numString.length-2];
        if ([_numString hasPrefix:@"."]) {
            [_numString insertString:@"0" atIndex:0];
        }
    }else{
        [_numString setString:@"0.00"];
    }
    UILabel * numLabel = (UILabel *)[self.view viewWithTag:11];
    numLabel.text = _numString;
    NSLog(@"%@",_numString);
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
