//
//  TableViewController.m
//  MVVMDemo
//
//  Created by mac on 15/11/5.
//  Copyright © 2015年 xiaowei. All rights reserved.
//

#import "TableViewController.h"
#import "YiRefresh.h"
#import "TableViewDataSource.h"
#import "TableViewDelegate.h"
#import "ImitateViewModel.h"

@interface TableViewController ()
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *totalSource;

@property (nonatomic, strong) ImitateViewModel *imitateModel;
@property (nonatomic, strong) TableViewDataSource *tableViewDataSource;
@property (nonatomic, strong) TableViewDelegate *tableViewDelegate;

@property (nonatomic, strong) YiRefreshFooter *refreshFooter;
@property (nonatomic, strong) YiRefreshHeader *refreshHeader;


@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeTheme];
    [self autoLayoutByiOS7Later];
    [self customizeInterface];
    
}
-(void)customizeInterface{
    
    _tableViewDataSource = [TableViewDataSource new];
    _tableViewDelegate = [TableViewDelegate new];
    _imitateModel = [ImitateViewModel new];
    _totalSource = [NSMutableArray array];
    
    _tableView = ({
        UITableView *tableView = [UITableView new];
        tableView.frame = CGRectMake(0, 0, YiScreenWidth, YiScreenHeight - 64);
        tableView.delegate = _tableViewDelegate;
        tableView.dataSource = _tableViewDataSource;
        [self.view addSubview:tableView];
        tableView;
    });
   
    __weak typeof(self) weakSelf = self;
    
    _refreshHeader = ({
        YiRefreshHeader *refreshHeader = [YiRefreshHeader new];
        refreshHeader.scrollView = _tableView;
        [refreshHeader header];
        refreshHeader.beginRefreshingBlock = ^(){
            [weakSelf headerRefreshing];
        };
        [refreshHeader beginRefreshing];
        refreshHeader;
    });
    
    _refreshFooter = ({
        YiRefreshFooter *refreshFooter = [YiRefreshFooter new];
        refreshFooter.scrollView = _tableView;
        [refreshFooter footer];
        refreshFooter.beginRefreshingBlock = ^(){
            [weakSelf footerRefreshing];
        };

        refreshFooter;
    });
    
}
-(void)autoLayoutByiOS7Later{
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    }
}
-(void)customizeTheme{
    self.title = @"MVVMDemo_maxim";
    [self.view setBackgroundColor:[UIColor whiteColor]];
}
#pragma mark - Refresh 
-(void)headerRefreshing{
    __weak typeof(self) weakSelf = self;
    [self.imitateModel headerRefreshRequestWithCallBack:^(NSArray *array) {
        if (self.totalSource.count > 0) {
            NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, array.count)];
            [weakSelf.totalSource insertObjects:array atIndexes:set];
        }else{
            weakSelf.totalSource = [NSMutableArray arrayWithArray:array];
        }
        weakSelf.tableViewDataSource.array = self.totalSource;
        weakSelf.tableViewDelegate.array = self.totalSource;
        [weakSelf.refreshHeader endRefreshing];
        [weakSelf.tableView reloadData];
    }];

}
-(void)footerRefreshing{
      __weak typeof(self) weakSelf = self;
      [self.imitateModel footerRefreshRequestWithCallBack:^(NSArray *array) {
      [weakSelf.totalSource addObjectsFromArray:array];
       weakSelf.tableViewDataSource.array = self.totalSource;
       weakSelf.tableViewDelegate.array = self.totalSource;
       [weakSelf.tableView reloadData];
       [weakSelf.refreshFooter endRefreshing];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
