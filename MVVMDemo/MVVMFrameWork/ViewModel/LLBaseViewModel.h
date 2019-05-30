//
//  LLBaseViewModel.h
//  JLCMetal
//
//  Created by lanlan on 2019/5/21.
//  Copyright © 2019 周尊贤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+LLMJParse.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^sucessBlock)(BOOL isSucess);
@class LLBaseVC;
@interface LLBaseViewModel : NSObject
//公有构造方法
- (instancetype)initWithVC:(LLBaseVC *)viewController;

@property(nonatomic ,weak)LLBaseVC * viewController;

/**
 分页索引
 */
@property(nonatomic,assign) NSInteger pageIndex;



-(void)requestWithURL:(sucessBlock __nullable)  sucessBlock;


/**
 数据解析

 @param json 传入json
 @param parsingClass 模型的类
 @param parsingBlock 解析完成的回调
 */
- (void)parsingWithJSON:(id ) json parsingClass:(Class)parsingClass parsingBlock:(void (^)(BOOL isSucess , id __nullable result ))parsingBlock;

- (void)parsingWithJSON:(id ) json parsingBlock:(void (^)(BOOL isSucess , id __nullable result ))parsingBlock;


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
