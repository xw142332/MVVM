//
//  TableViewDataSource.h
//  MVVMDemo
//
//  Created by mac on 15/11/5.
//  Copyright © 2015年 xiaowei. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TableViewDataSource : NSObject<UITableViewDataSource>
@property (nonatomic, strong) NSArray *array;
@end
