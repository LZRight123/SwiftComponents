//
//  SwiftNSObject.h
//  SwiftComponents
//
//  Created by 梁泽 on 2020/12/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwiftNSObject : NSObject
+ (void)swift_load;
+ (void)swift_initialize;
@end

NS_ASSUME_NONNULL_END
