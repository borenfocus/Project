//
//  HomeDataModel.m
//  Project
//
//  Created by dym on 2017/6/8.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "HomeDataModel.h"
#import "HomeDataEntity.h"

@implementation HomeDataModel

- (instancetype)init{
    if (self = [super init]) {
        
        [self addListSectionData];
        
        [self addListSectionNewsData];
    }
    return self;
}

//获取彩票数据
- (void)addListSectionData{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"HomeHtmlLIst.json" ofType:nil];
     NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dict in jsonDict[@"data"]) {
        HomeDataEntity *entity = [HomeDataEntity homeDataEntityWithDict:dict];
        [array addObject:entity];
    }
    self.listArray = array;
}


- (void)addListSectionNewsData{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"HomeHtmlNews.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dict in jsonDict[@"data"]) {
        HomeDataEntity *entity = [HomeDataEntity homeDataEntityWithDict:dict];
        [array addObject:entity];
    }
    self.newsArray = array;
}

- (NSArray*)listArray{
    if (!_listArray) {
        _listArray  = [NSArray array];
    }
    return _listArray;
}

- (NSArray*)newsArray{
    if (!_newsArray) {
        _newsArray  = [NSArray array];
    }
    return _newsArray;
}
@end