//
//  LLBaseVC.h
//  JLCMetal
//
//  Created by lanlan on 2019/5/23.
//  Copyright © 2019 周尊贤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLBaseViewModel.h"
#import "LLBaseCustomView.h"
NS_ASSUME_NONNULL_BEGIN

@interface LLBaseVC : UIViewController
@property(nonatomic ,strong)LLBaseViewModel * viewModel;
@property(nonatomic,strong) LLBaseCustomView *customView;
-(void)setupUI;
-(void)setupData;
-(void)setupViemModel;
@end

NS_ASSUME_NONNULL_END
