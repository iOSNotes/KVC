//
//  ViewController.m
//  KVO初探
//
//  Created by 秦传龙 on 2020/7/21.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.person = [Person new];
    self.person.writeData = 0;
    self.person.totalData = 134500;
    [self.person addObserver:self forKeyPath:@"downloadProgress" options:NSKeyValueObservingOptionNew context:NULL];
//    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:NULL];
    [self.person addObserver:self forKeyPath:@"dataArr" options:NSKeyValueObservingOptionNew context:NULL];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.person.writeData += 20.34;
//    [self.person.dataArr addObject:@"1"];
    [[self.person mutableArrayValueForKey:@"dataArr"] addObject:@"12"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@- %@", keyPath, change);
}


- (void)dealloc {
    [self removeObserver:self forKeyPath:@"name"];
     [self removeObserver:self forKeyPath:@"age"];
}


@end
