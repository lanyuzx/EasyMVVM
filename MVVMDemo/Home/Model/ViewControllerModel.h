//
//  ViewControllerModel.h
//  MVVMDemo
//
//  Created by lanlan on 2019/5/25.
//  Copyright © 2019 lanlan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class ViewControllerItemModel;
@interface ViewControllerModel : NSObject
@property(nonatomic,copy) NSString *version;
@property(nonatomic,copy) NSArray <ViewControllerItemModel *> *list;
@end

@interface ViewControllerItemModel : NSObject
@property(nonatomic,copy) NSString *book_id;
@property(nonatomic,copy) NSString *book_name;
@property(nonatomic,copy) NSString *cover;
@end

NS_ASSUME_NONNULL_END
