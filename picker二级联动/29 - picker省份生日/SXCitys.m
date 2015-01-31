//
//  SXCitys.m
//  29 - picker省份生日
//
//  Created by 董 尚先 on 14-5-20.
//  Copyright (c) 2014年 shangxianDante. All rights reserved.
//

#import "SXCitys.h"

@implementation SXCitys

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    SXCitys *city = [[self alloc]init];
    [city setValuesForKeysWithDictionary:dict];
    return city;
}

@end
