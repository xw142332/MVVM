//
//  ImitateViewModel.m
//  MVVMDemo
//
//  Created by mac on 15/11/5.
//  Copyright © 2015年 xiaowei. All rights reserved.
//  ViewModel : 模拟网络访问

#import "ImitateViewModel.h"
#import "ImitateModel.h"
@implementation ImitateViewModel
-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}


-(void)headerRefreshRequestWithCallBack:(callback)callback{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            //主线程刷新视图
            NSMutableArray *mArray = [NSMutableArray array];
            for (int i = 0; i < 9; i++) {
                int randomNumber = arc4random() % 100;
                NSString *maximString = [NSString stringWithFormat:@"(ramdom %d) 生活是一种绵延不绝的渴望,渴望不断上升,变得更伟大而高贵。",randomNumber];
                ImitateModel *imitateModel = [ImitateModel new];
                imitateModel.maxim = maximString;
                [mArray addObject:imitateModel];
            }
            callback(mArray);
        });
    });
}
-(void)footerRefreshRequestWithCallBack:(callback)callback{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            //主线程刷新视图
            NSMutableArray *mArray = [NSMutableArray array];
            for (int i = 0; i < 9; i++) {
                int randomNumber = arc4random() % 100;
                NSString *maximString = [NSString stringWithFormat:@"(ramdom %d) 人生下来不是为了拖着锁链,而是要解开枷锁-雨果",randomNumber];
                ImitateModel *imitateModel = [ImitateModel new];
                imitateModel.maxim = maximString;
                [mArray addObject:imitateModel];
            }
             callback(mArray);
        });
    });
}
@end
