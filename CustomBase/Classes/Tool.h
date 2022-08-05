//
//  Tool.h
//  CustomLib1
//
//  Created by zhangxuewei on 2022/8/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tool : NSObject

#pragma mark  正则判断手机号是否正确

+ (BOOL)validateNumber:(NSString *) textString;

@end

NS_ASSUME_NONNULL_END
