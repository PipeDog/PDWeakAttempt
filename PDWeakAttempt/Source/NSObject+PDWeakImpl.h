//
//  NSObject+PDWeakImpl.h
//  PDWeakAttempt
//
//  Created by liang on 2019/8/19.
//  Copyright © 2019 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  使用assign实现weak关键字属性
 *      ```
 *      Person *person = [[Person alloc] init];
 *      self.person = person; // person是由assign修饰的
 *      [person pd_runAtDealloc:^{
 *          self.person = nil;
 *      }];
 *      ```
 */

@interface NSObject (PDWeakImpl)

- (void)pd_runAtDealloc:(void (^)(void))block;

@end

NS_ASSUME_NONNULL_END
