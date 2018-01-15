//
//  YXDelayTask.m
//  KG_Video
//
//  Created by baye on 2018/1/15.
//  Copyright © 2018年 快更. All rights reserved.
//

#import "YXDelayTask.h"

@interface YXDelayTask ()

@property (nonatomic, copy) void (^taskBlock)(BOOL cancel);
@property (nonatomic) dispatch_queue_t queue;

@end

@implementation YXDelayTask

+ (instancetype)delay:(NSTimeInterval)time queue:(dispatch_queue_t)queue task:(dispatch_block_t)task {
    return [[self alloc] initWithDelayTime:time queue:queue task:task];
}

+ (instancetype)delay:(NSTimeInterval)time task:(dispatch_block_t)task {
    return [[self alloc] initWithDelayTime:time queue:nil task:task];
}

- (instancetype)initWithDelayTime:(NSTimeInterval)delayTime queue:(dispatch_queue_t)queue task:(dispatch_block_t)task {
    if (self = [super init]) {
        _queue = queue ? : dispatch_get_main_queue();
        _taskBlock = ^(BOOL cancel) {
            if (!cancel) {
                if (task) {
                    task();
                }
            }
        };
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), _queue, ^{
            if (_taskBlock) {
                _taskBlock(false);
                _taskBlock = nil;
            }
        });
    }
    return self;
}

- (void)cancel {
    dispatch_async(_queue, ^{
        if (_taskBlock) {
            _taskBlock(true);
            _taskBlock = nil;
        }
    });
}

@end
