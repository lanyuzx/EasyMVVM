//
//  LLBaseModel.h
//  MVVMDemo
//
//  Created by lanlan on 2019/5/25.
//  Copyright © 2019 lanlan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLBaseModel : NSObject
@property(nonatomic,assign) NSInteger status;
@property(nonatomic,strong) id data;
@property(nonatomic,copy) NSString * msg;
@end

NS_ASSUME_NONNULL_END
