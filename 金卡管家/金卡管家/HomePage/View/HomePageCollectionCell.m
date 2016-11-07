//
//  HomePageCollectionCell.m
//  金卡管家
//
//  Created by Scott on 2016/11/3.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "HomePageCollectionCell.h"

@implementation HomePageCollectionCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        UIView * view = [[UIView alloc]initWithFrame:self.bounds];
        view.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:view];
        self.headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, HEIGHTSIZE(10), WIDTHSIZE(40), HEIGHTSIZE(40))];
        CGPoint center = self.center;
        center.x = self.bounds.size.width/2;
        center.y = HEIGHTSIZE(40);
        self.headImageView.center = center;
        [view addSubview:self.headImageView];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHTSIZE(60), self.frame.size.width, HEIGHTSIZE(50))];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.font = [UIFont systemFontOfSize:HEIGHTSIZE(16)];
        self.nameLabel.textColor = [UIColor blackColor];
        
        [view addSubview:self.nameLabel];
    }
    return self;
}

@end
