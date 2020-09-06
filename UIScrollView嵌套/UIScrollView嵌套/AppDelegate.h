//
//  AppDelegate.h
//  UIScrollView嵌套
//
//  Created by 秦传龙 on 2020/9/6.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

