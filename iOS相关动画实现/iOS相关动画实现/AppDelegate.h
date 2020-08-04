//
//  AppDelegate.h
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/7/30.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@property (strong, nonatomic) UIWindow * window;
@end

