//
//  WLAddressModel.m
//  WLPickerView
//
//  Created by 刘光强 on 2018/5/18.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLAddressModel.h"

@implementation WLAddressModel

- (NSMutableArray *)list {
    if (!_list) {
        _list = [NSMutableArray array];
    }
    return _list;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        if (dictionary) {
            self.name = dictionary[@"name"];
            self.zipcode = dictionary[@"zipcode"];
        }
    }
    return self;
}

@end

@implementation CityModel

- (NSMutableArray *)list {
    if (!_list) {
        _list = [NSMutableArray array];
    }
    return _list;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        if (dictionary) {
            self.name = dictionary[@"name"];
            self.zipcode = dictionary[@"zipcode"];
        }
    }
    return self;
}

@end

@implementation DistrictModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        if (dictionary) {
            self.name = dictionary[@"name"];
            self.zipcode = dictionary[@"zipcode"];
        }
    }
    return self;
}
@end
