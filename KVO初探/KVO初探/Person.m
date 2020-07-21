//
//  Person.m
//  KVO初探
//
//  Created by 秦传龙 on 2020/7/21.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"downloadProgress"]) {
        NSArray *affectingKeys = @[@"writeData", @"totalData"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:affectingKeys];
    }
    return keyPaths;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    return YES;
}

- (void)setName:(NSString *)name {
    [self willChangeValueForKey:@"name"];
    _name = name;
    [self didChangeValueForKey:@"name"];
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}


- (NSString *)downloadProgress {
    if (self.writeData == 0) {
        self.writeData = 10;
    }
    if (self.totalData == 0) {
        self.totalData = 100;
    }
    
    return [NSString stringWithFormat:@"%0.2f", self.writeData / self.totalData];
}

@end
