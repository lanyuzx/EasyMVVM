//
//  LLBaseVCView.m
//  JLCMetal
//
//  Created by lanlan on 2019/5/23.
//  Copyright © 2019 周尊贤. All rights reserved.
//

#import "LLBaseCustomView.h"

@implementation LLBaseCustomView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"You must override %@ in %@", NSStringFromSelector(_cmd), self.class]
                                     userInfo:nil];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame viewController:(LLBaseVC*)viewController
{
    self = [super initWithFrame:frame];
    if (self) {
        self.viewContrller = viewController;
        [self tableViewRegistClassView];
        [self setupUI];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame viewController:(LLBaseVC *)viewController tableView:(UITableView *)tableView {
    self = [super initWithFrame:frame];
    if (self) {
        self.viewContrller = viewController;
        self.tableView = tableView;
        [self tableViewRegistClassView];
        [self setupUI];
    }
    return self;
}

-(void)addMJRefreshHeader {
    __block typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.viewContrller.viewModel.pageIndex = 1;
        [weakSelf.viewContrller setupData];
    }];
    
}
-(void)addMJRefreshFooter {
    __block typeof(self) weakSelf = self;
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
         weakSelf.viewContrller.viewModel.pageIndex ++;
        [weakSelf.viewContrller setupData];
    }];
}

-(void)setupUI {}

-(void)tableViewRegistClassView {}

@end
