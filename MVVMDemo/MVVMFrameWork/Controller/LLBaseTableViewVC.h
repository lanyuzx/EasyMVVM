//
//  LLBaseTableViewVC.h
//  JLCMetal
//
//  Created by lanlan on 2019/5/21.
//  Copyright © 2019 周尊贤. All rights reserved.
//
#import "LLBaseTableViewVC.h"
#import "LLBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLBaseTableViewVC : LLBaseVC <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)UITableView * tableView;


- (instancetype)initWithTableViewStyle:(UITableViewStyle)style;



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView ;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section ;

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section ;

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section ;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath ;

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section ;

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section ;

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath ;

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath ;

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath ;

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath ;
@end

NS_ASSUME_NONNULL_END
