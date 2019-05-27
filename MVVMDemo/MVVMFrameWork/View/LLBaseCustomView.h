//
//  LLBaseVCView.h
//  JLCMetal
//
//  Created by lanlan on 2019/5/23.
//  Copyright © 2019 周尊贤. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@class LLBaseVC;
@interface LLBaseCustomView : UIView
@property(nonatomic ,strong)LLBaseVC * viewContrller;
@property(nonatomic,strong) UITableView *tableView;
-(void)setupUI;

-(void)tableViewRegistClassView;


/**
 添加上拉刷新
 */
-(void)addMJRefreshHeader ;

/**
 添加下拉加载
 */
-(void)addMJRefreshFooter;

/**
 此方法是单纯的试图

 @param frame 位置 一般传zore
 @param viewController  当前控制器
 @return LLBaseVCView
 */
- (instancetype)initWithFrame:(CGRect)frame viewController:(LLBaseVC *)viewController;

/**
 此方法是页面有tableview

 @param frame 位置 一般传zore
 @param viewController 当前控制器
 @param tableView 继承LLBaseTableViewVC的tabView
 @return LLBaseVCView
 */
- (instancetype)initWithFrame:(CGRect)frame viewController:(LLBaseVC *)viewController tableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
