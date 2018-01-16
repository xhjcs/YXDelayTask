//
//  YXDelayTask.m
//  Example
//
//  Created by Heikki on 2018/1/15.
//  Copyright © 2018年 Heikki. All rights reserved.
//

#import "YXDelayTask.h"

@interface YXDelayTask ()

@property (nonatomic, copy) void (^taskBlock)(void);
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
        _taskBlock = [task copy];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), _queue, ^{
            if (_taskBlock) {
                _taskBlock();
                _taskBlock = nil;
            }
            _queue = nil;
        });
    }
    return self;
}

- (void)cancel {
    dispatch_async(_queue, ^{
        _taskBlock = nil;
        _queue = nil;
    });
}

@end
