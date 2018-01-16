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

@property (nonatomic) dispatch_queue_t queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.queue = dispatch_queue_create("com.YXDelayTask.queue", DISPATCH_QUEUE_CONCURRENT);
    
    YXDelayTask *delayTask = [YXDelayTask delay:1.0 task:^{
        NSLog(@"heiheihei");
    }];
    
    [delayTask cancel];
    
    YXDelayTask *delayTask1 = [YXDelayTask delay:3.0 queue:self.queue task:^{
        NSLog(@"hahaha");
    }];
    
    // 延迟2.5秒取消
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), self.queue, ^{
        [delayTask1 cancel];
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
