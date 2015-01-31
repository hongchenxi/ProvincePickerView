//
//  NSObject+array.h
//  29 - picker省份生日
//
//  Created by 董 尚先 on 14-5-20.
//  Copyright (c) 2014年 shangxianDante. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (array)

/**
 *  把字典数组转换成模型数组
 *
 *  @param dictArr 字典数组
 *
 *  @return 返回模型数组
 */
+ (NSArray *)objectArrWithDictArr:(NSArray *)dictArr;

@end
