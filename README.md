YXDelayTask
==============

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/xinghanjie/YXDelayTask/blob/master/LICENSE)&nbsp;
[![CocoaPods](https://img.shields.io/cocoapods/p/YXDelayTask.svg?style=flat)](https://github.com/xinghanjie/YXDelayTask)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;

Support for the cancellation of the delayed task framework.

Features
==============
- **Delay**: Deferred execution code.
- **Queue**: Support for specifying thread queue.
- **Cancel**: Support cancellation delay task .

Usage
==============
```objc
    YXDelayTask *delayTask = [YXDelayTask delay:3 queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0) task:^{
        NSLog(@"hahaha");
    }];

    // 延迟2.5秒取消
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [delayTask cancel];
    });

    YXDelayTask *delayTask1 = [YXDelayTask delay:1.0 task:^{
        NSLog(@"heiheihei");
    }];

    [delayTask1 cancel];
```

Installation
==============

### CocoaPods

1. Add `pod 'YXDelayTask'` to your Podfile.
2. Run `pod install` or `pod update`.
3. import <YXDelayTask/YXDelayTask.h>.
