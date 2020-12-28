//
//  SwiftNSObject.m
//  SwiftComponents
//
//  Created by 梁泽 on 2020/12/28.
//

#import "SwiftNSObject.h"

@implementation SwiftNSObject
+ (void)load {
    [self swift_load];
}

+ (void)initialize
{
    if (self == [SwiftNSObject class]) {
        
    }
    [self swift_initialize];
}

+ (void)swift_load {
    
}

+ (void)swift_initialize {
    
}
@end
