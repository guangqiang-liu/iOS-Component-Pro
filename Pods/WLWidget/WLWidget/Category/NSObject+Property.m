//
//  NSObject+Property.m
//  LSBuyer
//
//  Created by 刘光强 on 16/7/5.
//  Copyright © 2016年 lianshang. All rights reserved.
//

#import "NSObject+Property.h"

@implementation NSObject (Property)

+ (void)createPropertyCodeWithDict:(NSDictionary *)dict {
    NSMutableString *strM = [NSMutableString string];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
        NSString *code;
        if ([value isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;", propertyName];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSCFNumber *%@;", propertyName];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFArray")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSArray *%@;", propertyName];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFDictionary")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSDictionary *%@;", propertyName];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;", propertyName];
        }
        [strM appendFormat:@"\n%@\n", code];
    }];
    NSLog(@"%@",strM);
}

@end
