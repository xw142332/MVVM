//
//  TableViewDataSource.m
//  MVVMDemo
//
//  Created by mac on 15/11/5.
//  Copyright © 2015年 xiaowei. All rights reserved.
//

#import "TableViewDataSource.h"
#import "ImitateTableViewCell.h"
#import "ImitateModel.h"
@implementation TableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ImitateTableViewCell *cell = [ImitateTableViewCell cellWithTableView:tableView];
    cell.textLabel.text = ((ImitateModel *)self.array[indexPath.row]).maxim;
    NSLog(@"%@",((ImitateModel *)self.array[indexPath.row]).maxim);
    return cell;
}


@end
