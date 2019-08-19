//
//  PDWeakSingleton.m
//  PDWeakAttempt
//
//  Created by liang on 2019/8/19.
//  Copyright © 2019 liang. All rights reserved.
//

#import "PDWeakSingleton.h"

@implementation PDWeakSingleton

- (void)dealloc {
    NSLog(@"[PDWeakSingleton class] object %@ dealloc", self);
}

+ (instancetype)sharedWeakInstance {
    __weak static PDWeakSingleton *_weakSingleton;
    PDWeakSingleton *_strongSingleton = _weakSingleton;
    @synchronized (self) {
        if (!_strongSingleton) {
            _strongSingleton = [[PDWeakSingleton alloc] init];
            _weakSingleton = _strongSingleton;
        }
    }
    return _strongSingleton;
}

- (void)log {
    NSLog(@"Print something...");
}


@end
