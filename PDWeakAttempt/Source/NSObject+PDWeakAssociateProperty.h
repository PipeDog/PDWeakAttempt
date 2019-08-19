//
//  NSObject+PDWeakAssociateProperty.h
//  PDWeakAttempt
//
//  Created by 雷亮 on 2019/8/19.
//  Copyright © 2019 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * objc_AssociationPolicy不存在weak对应的关联类型，这里利用block作为中间层，实现weak的关联类型
 */

@interface NSObject (PDWeakAssociateProperty)

@property (nonatomic, weak) id arg;

@end

NS_ASSUME_NONNULL_END
