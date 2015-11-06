//
//  TableViewDelegate.m
//  MVVMDemo
//
//  Created by mac on 15/11/5.
//  Copyright © 2015年 xiaowei. All rights reserved.
//

#import "TableViewDelegate.h"
#import "ImitateModel.h"
@implementation TableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //do someThing
    if (_array.count > 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:((ImitateModel *)[_array objectAtIndex:indexPath.row]).maxim delegate:nil cancelButtonTitle:@"sure" otherButtonTitles:nil, nil];
        [alert show];
    }
}
@end
