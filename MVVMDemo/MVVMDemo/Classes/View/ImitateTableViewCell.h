//
//  ImitateTableViewCell.h
//  MVVMDemo
//
//  Created by mac on 15/11/5.
//  Copyright © 2015年 xiaowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImitateTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) UILabel *titleLabel;
@end
