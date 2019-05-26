//
//  LLBaseVC.m
//  JLCMetal
//
//  Created by lanlan on 2019/5/23.
//  Copyright © 2019 周尊贤. All rights reserved.
//

#import "LLBaseVC.h"

@interface LLBaseVC ()

@end

@implementation LLBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViemModel];
    [self setupUI];
    [self setupData];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:false animated:true];

}

-(void)setupUI {}

-(void)setupData{}

-(void)setupViemModel{}

/// MARK: ---- 懒加载
//-(LLBaseViewModel *)viewModel {
//    if (!_viewModel) {
//        _viewModel = [[LLBaseViewModel alloc] initWithVC:self];
//    }
//    return _viewModel;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
