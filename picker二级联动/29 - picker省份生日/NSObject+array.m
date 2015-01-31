//
//  NSObject+array.m
//  29 - picker省份生日
//
//  Created by 董 尚先 on 14-5-20.
//  Copyright (c) 2014年 shangxianDante. All rights reserved.
//

#import "NSObject+array.h"

@implementation NSObject (array)

+ (NSArray *)objectArrWithDictArr:(NSArray *)dictArr
{
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSDictionary *dict in dictArr) {
        id province = [[self alloc] init];
        [province setValuesForKeysWithDictionary:dict];
        [arrM addObject:province];
        
    }
    return arrM;
    
    
}

@end
