//
//  NSObject+CLKeyValueObserving.h
//  KVO自定义监听方法
//
//  Created by 秦传龙 on 2020/7/21.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CLKeyValueObserving)

- (void)cl_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;



@end



NS_ASSUME_NONNULL_END
