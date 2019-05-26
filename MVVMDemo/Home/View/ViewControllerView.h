//
//  ViewControllerView.h
//  MVVMDemo
//
//  Created by lanlan on 2019/5/25.
//  Copyright © 2019 lanlan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerView : LLBaseCustomView

@end
@class ViewControllerModel;
@class ViewControllerItemModel;
@interface ViewControllerTableHeaderView : UITableViewHeaderFooterView
@property(nonatomic,strong) ViewControllerModel *model;
@end

@interface ViewControllerCellView : UITableViewCell
@property(nonatomic,strong) ViewControllerItemModel *model;
@end
NS_ASSUME_NONNULL_END
