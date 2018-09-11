//
//  WLAddressModel.h
//  WLPickerView
//
//  Created by 刘光强 on 2018/5/18.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CityModel,DistrictModel,GDataXMLElement;

@interface WLAddressModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *zipcode;
@property (nonatomic, strong) NSString *index;
@property (nonatomic, strong) NSMutableArray<CityModel *> *list;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface CityModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *zipcode;
@property (nonatomic, strong) NSString *index;
@property (nonatomic, strong) NSMutableArray<DistrictModel *> *list;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface DistrictModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *zipcode;
@property (nonatomic, strong) NSString *index;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
