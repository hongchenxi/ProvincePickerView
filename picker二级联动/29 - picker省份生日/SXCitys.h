//
//  SXCitys.h
//  29 - picker省份生日
//
//  Created by 董 尚先 on 14-5-20.
//  Copyright (c) 2014年 shangxianDante. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SXCitys : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,strong) NSArray *cities;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
