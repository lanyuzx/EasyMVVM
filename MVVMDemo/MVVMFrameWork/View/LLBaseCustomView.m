//
//  LLBaseVCView.m
//  JLCMetal
//
//  Created by lanlan on 2019/5/23.
//  Copyright © 2019 周尊贤. All rights reserved.
//

#import "LLBaseCustomView.h"

@implementation LLBaseCustomView

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

-(void)setupUI {}

-(void)tableViewRegistClassView {}

@end
