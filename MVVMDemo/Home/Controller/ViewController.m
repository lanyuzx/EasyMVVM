//
//  ViewController.m
//  MVVMDemo
//
//  Created by lanlan on 2019/5/25.
//  Copyright © 2019 lanlan. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerView.h"
#import "ViewControllerViewModel.h"
@interface ViewController ()

@end

@implementation ViewController

-(void)setupViemModel {
    [super setupViemModel];
    self.viewModel = [[ViewControllerViewModel alloc] initWithVC:self];
}
-(void)setupUI {
    [super setupUI];
    self.title = @"MVVM custom view";
    self.customView = [[ViewControllerView alloc] initWithFrame:CGRectZero viewController:self tableView:self.tableView];
    [self.view addSubview:self.customView];
    [self.customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
    }];
    [self addMJRefreshFooter];
    [self addMJRefreshHeader];
}
-(void)setupData {
    [super setupData];
    [self.viewModel requestWithURL:^(BOOL isSucess) {
        if (isSucess) {
            [self.tableView reloadData];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
}


@end
