//
//  NSObject+LLMJParse.m
//  JLCSteelProject
//
//  Created by 周尊贤 on 2017/7/24.
//  Copyright © 2017年 周尊贤. All rights reserved.
//

#import "NSObject+LLMJParse.h"
#import "MJExtension.h"
@implementation NSObject (LLMJParse)

+(id)LLMJParse:(id)responseObj {
    //转字典
    if ([responseObj isKindOfClass:[NSDictionary class]])
    {
        return [self mj_objectWithKeyValues:responseObj];
        
        
    }
    //转数组
    if ([responseObj isKindOfClass:[NSArray class]])
    {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    //转 plist
    if ([responseObj isKindOfClass:[NSString class]]) {
        return [self mj_objectWithFilename:responseObj];
    }
    
    return responseObj;
}
@end
