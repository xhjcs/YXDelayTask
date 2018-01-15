//
//  ViewController.m
//  Example
//
//  Created by baye on 2018/1/15.
//  Copyright © 2018年 Heikki. All rights reserved.
//

#import "ViewController.h"
#import "YXDelayTask.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    YXDelayTask *delayTask = [YXDelayTask delay:3.0 task:^{
        NSLog(@"哈哈");
    }];
    
    // 延迟一下
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [delayTask cancel];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
