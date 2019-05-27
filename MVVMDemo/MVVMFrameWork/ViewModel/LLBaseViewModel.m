//
//  LLBaseViewModel.m
//  JLCMetal
//
//  Created by lanlan on 2019/5/21.
//  Copyright © 2019 周尊贤. All rights reserved.
//

#import "LLBaseViewModel.h"
#import "LLBaseModel.h"

@implementation LLBaseViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"You must override %@ in %@", NSStringFromSelector(@selector(initWithVC:)), self.class]
                                     userInfo:nil];
    }
    return self;
}
- (instancetype)initWithVC:(UIViewController *)viewController
{
    self = [super init];
    if (self) {
        self.viewController = viewController;
        self.pageIndex = 1;
    }
    return self;
}

-(void)requestWithURL:(sucessBlock) sucessBlock {}

-(void)parsingWithJSON:(id)json parsingClass:(Class)parsingClass parsingBlock:(void (^)(BOOL, id _Nullable))parsingBlock {
    if (![json isKindOfClass:[NSDictionary class]]) {
        parsingBlock(false,nil);
        return;
    }
    LLBaseModel *   baseModel = [LLBaseModel LLMJParse:json];
    if (baseModel.status != 1) {
        parsingBlock(false,nil);
        return;
    }
    parsingBlock(true , [parsingClass LLMJParse:baseModel.data]);
}

-(void)parsingWithJSON:(id)json parsingBlock:(void (^)(BOOL, id _Nullable))parsingBlock {
    if (![json isKindOfClass:[NSDictionary class]]) {
        parsingBlock(false,nil);
        return;
    }
    LLBaseModel *   baseModel = [LLBaseModel LLMJParse:json];
    if (baseModel.status != 1) {
        parsingBlock(false,nil);
        return;
    }
    parsingBlock(true , baseModel.data);
}

/// MARK: ---- 数据源方法 这里实现数据源方法只是为了消除警告
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return UIView.new;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return UIView.new;
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
@end
