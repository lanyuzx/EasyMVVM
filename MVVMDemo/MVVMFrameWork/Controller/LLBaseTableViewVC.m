//
//  LLBaseTableViewVC.m
//  JLCMetal
//
//  Created by lanlan on 2019/5/21.
//  Copyright © 2019 周尊贤. All rights reserved.
//

#import "LLBaseTableViewVC.h"
#import "MJRefresh.h"
@interface LLBaseTableViewVC ()

@end

@implementation LLBaseTableViewVC

-(void)setupUI {
    [super setupUI];
    //tabView的布局不在这里添加 交给实现的子类处理
}

-(void)addMJRefreshHeader {
    __block typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.viewModel.pageIndex = 1;
        [weakSelf setupData];
    }];
    
}
-(void)addMJRefreshFooter {
    __block typeof(self) weakSelf = self;
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.viewModel.pageIndex ++;
        [weakSelf setupData];
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewModel numberOfSectionsInTableView:tableView] ? [self.viewModel numberOfSectionsInTableView:tableView] : 1 ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel tableView:tableView numberOfRowsInSection:section];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self.viewModel tableView:tableView viewForHeaderInSection:section];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [self.viewModel tableView:tableView viewForFooterInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel tableView:tableView cellForRowAtIndexPath:indexPath];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self.viewModel tableView:tableView heightForHeaderInSection:section];;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [self.viewModel tableView:tableView heightForFooterInSection:section];;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel tableView:tableView heightForRowAtIndexPath:indexPath];
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel tableView:tableView canEditRowAtIndexPath:indexPath];;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel tableView:tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel tableView:tableView titleForDeleteConfirmationButtonForRowAtIndexPath:indexPath];;
}
/// MARK: ---- 数据源方法 这里实现数据源方法只是为了消除警告
/*
 -(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 return 0;
 }
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 return 0;
 }
 -(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
 return UITableViewHeaderFooterView.new;
 }
 -(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
 return UITableViewHeaderFooterView.new;
 }
 
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 return UITableViewCell.new;
 }
 -(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
 return 0;
 }
 -(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
 return 0;
 }
 -(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 return 0;
 }
 -(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 return false;
 }
 -(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 }
 -(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
 return @"删除";
 }
 */

/// MARK: ---- 懒加载
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.tableViewStyle];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
