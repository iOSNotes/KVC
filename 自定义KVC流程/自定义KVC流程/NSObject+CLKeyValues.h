//
//  NSObject+CLKeyValues.h
//  自定义KVC流程
//
//  Created by 秦传龙 on 2020/7/20.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CLKeyValues)

/*看了很多技术博客都讲解有误、或者说有遗漏，本方法是根据官方文档，并参考技术博客进行修改而得*/
- (void)cl_setValue:(nullable id)value forKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
