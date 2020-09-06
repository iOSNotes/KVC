//
//  AppDelegate.h
//  AutoBuild
//
//  Created by 秦传龙 on 2020/8/28.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (strong, nonatomic) UIWindow * window;
- (void)saveContext;


@end

