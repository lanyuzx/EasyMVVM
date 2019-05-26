//
//  NSObject+LLMJParse.h
//  JLCSteelProject
//
//  Created by 周尊贤 on 2017/7/24.
//  Copyright © 2017年 周尊贤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LLMJParse)

/**
 万能解析模型器

 @param responseObj 传入字典或者数组
 @return 模型字典或者数组
 */
+(id)LLMJParse:(id)responseObj;
@end
