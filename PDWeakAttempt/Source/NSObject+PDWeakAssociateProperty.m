//
//  NSObject+PDWeakAssociateProperty.m
//  PDWeakAttempt
//
//  Created by 雷亮 on 2019/8/19.
//  Copyright © 2019 liang. All rights reserved.
//

#import "NSObject+PDWeakAssociateProperty.h"
#import <objc/runtime.h>

@implementation NSObject (PDWeakAssociateProperty)

- (void)setArg:(id)arg {
    __weak typeof(arg) weakArg = arg;
    
    id (^block)(void) = ^{
        return weakArg;
    };
    
    objc_setAssociatedObject(self, @selector(arg), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)arg {
    id (^block)(void) = objc_getAssociatedObject(self, _cmd);
    return block ? block() : nil;
}

@end
