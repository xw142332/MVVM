//
//  ImitateViewModel.h
//  MVVMDemo
//
//  Created by mac on 15/11/5.
//  Copyright © 2015年 xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
//typedef void (^callback) (NSArray *array);
typedef void (^callback) (NSArray *array);
@interface ImitateViewModel : NSObject
//TableView 头部刷新数据
-(void)headerRefreshRequestWithCallBack:(callback)callback;
////TableView 尾部数据刷新
-(void)footerRefreshRequestWithCallBack:(callback)callback;
@end
