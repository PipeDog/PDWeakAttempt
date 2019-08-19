//
//  PDWeakSingleton.h
//  PDWeakAttempt
//
//  Created by liang on 2019/8/19.
//  Copyright © 2019 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  weak singleton
 *      可以用来解决单例过多，导致占用很多无用内存的问题，当没有强引用指向weak singleton对象时，
 *      该对象就会被释放，当sharedWeakInstance再次被调用时，对象将会被再次创建
 */

@interface PDWeakSingleton : NSObject

+ (instancetype)sharedWeakInstance;

- (void)log;

@end

NS_ASSUME_NONNULL_END
