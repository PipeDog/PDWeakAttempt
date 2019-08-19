//
//  NSObject+PDWeakImpl.m
//  PDWeakAttempt
//
//  Created by 雷亮 on 2019/8/19.
//  Copyright © 2019 liang. All rights reserved.
//

#import "NSObject+PDWeakImpl.h"
#import <objc/runtime.h>

@interface _PDBlockExector : NSObject {
    void (^_block)(void);
}

- (instancetype)initWithBlock:(void (^)(void))block;

@end

@implementation _PDBlockExector

- (instancetype)initWithBlock:(void (^)(void))block {
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}

- (void)dealloc {
    !_block ?: _block();
}

@end

@implementation NSObject (PDWeakImpl)

- (void)pd_runAtDealloc:(void (^)(void))block {
    if (block) {
        _PDBlockExector *exector = [[_PDBlockExector alloc] initWithBlock:block];
        objc_setAssociatedObject(self, _cmd, exector, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

@end
