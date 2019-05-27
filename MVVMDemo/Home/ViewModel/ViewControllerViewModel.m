//
//  ViewControllerViewModel.m
//  MVVMDemo
//
//  Created by lanlan on 2019/5/25.
//  Copyright © 2019 lanlan. All rights reserved.
//

#import "ViewControllerViewModel.h"
#import "ViewControllerModel.h"
#import "ViewControllerView.h"
#import "ViewController.h"
@interface ViewControllerViewModel()
@property(nonatomic ,strong)NSMutableArray <ViewControllerModel *> * dataList;
@end
@implementation ViewControllerViewModel
static NSString * const jsonUrl = @"http://new.api.bandu.cn/book/listofgrade?grade_id=2/";
-(void)requestWithURL:(sucessBlock)sucessBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html",nil];
    [manager GET:jsonUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self parsingWithJSON:responseObject parsingBlock:^(BOOL isSucess, id  _Nullable result) {
            if (!isSucess) {
                sucessBlock(false);
                return ;
            }
            NSArray * list = [ViewControllerModel LLMJParse:result[@"list"]];
            if (self.pageIndex == 1) {
                self.dataList = [NSMutableArray arrayWithArray:list];
            }else {
                [self.dataList addObjectsFromArray:list];
            }
                sucessBlock(true);
            
        }];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            sucessBlock(false);
        
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((ViewControllerModel*)self.dataList[section]).list.count;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ViewControllerTableHeaderView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ViewControllerTableHeaderView"];
    headerView.model = self.dataList[section];
    return headerView;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ViewControllerCellView * cell = [tableView dequeueReusableCellWithIdentifier:@"ViewControllerCellView"];
    cell.model = ((ViewControllerModel*)self.dataList[indexPath.section]).list[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 260;
}
@end
