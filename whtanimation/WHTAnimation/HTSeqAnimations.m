//
//  HTSeqAnimations.m
//  PatternColor
//
//  Created by Arthur on 15/10/26.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "HTSeqAnimations.h"

@implementation HTSeqAnimations

- (void)dealloc{
    NSLog(@"HTSeqAnimations dealloc");
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.animations = [NSMutableArray arrayWithCapacity:2];
    }
    return self;
}

- (void)addAnimation:(HTBasicAnimation*)anim{
    if (self.animations) {
        [self.animations addObject:anim];
    }
}


@end
