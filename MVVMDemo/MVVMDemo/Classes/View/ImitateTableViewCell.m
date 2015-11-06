//
//  ImitateTableViewCell.m
//  MVVMDemo
//
//  Created by mac on 15/11/5.
//  Copyright © 2015年 xiaowei. All rights reserved.
//

#import "ImitateTableViewCell.h"

@implementation ImitateTableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *reusedCell = @"Cell";
    ImitateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedCell];
    if (!cell) {
        cell = [[ImitateTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedCell
                ];
        }
    return cell;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self customizeViews];
    }
    return self;
}
-(void)customizeViews{
    _titleLabel = ({
        UILabel *titleLabel = [UILabel new];
        titleLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 50);
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:titleLabel];
        titleLabel;
    });
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
