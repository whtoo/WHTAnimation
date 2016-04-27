//
//  HTGroupAnimation.m
//  PatternColor
//
//  Created by Arthur on 15/10/27.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "HTGroupAnimation.h"

@implementation HTGroupAnimation

-(instancetype)init{
    self = [super init];
    if (self) {
        self.animations = [NSMutableArray arrayWithCapacity:2];
    }
    return self;
}
- (void)dealloc{
    if (self.animations) {
        [self.animations removeAllObjects];
    }
    self.animations = nil;
}
- (void)addAnimation:(HTBasicAnimation*)anim{
    //组动画时间等于本组中最长动画时间
    self.htDuration = MAX(self.htDuration, anim.htDuration);
    
    [self.animations addObject:anim];
}

- (void)removeAnimationAtIndex:(int)idx{
    NSAssert(idx < self.animations.count, @"removeAnimationAtIndex 不可越界");
    HTBasicAnimation* anim = [self.animations objectAtIndex:idx];
    
    if (anim) {
        [self.animations removeObjectAtIndex:idx];
    }
}

- (void)updt:(NSTimeInterval)delta{
    if (self.htDuration > self.htTimeOffset) {
        [self.animations enumerateObjectsUsingBlock:^(HTBasicAnimation * _Nonnull anim, NSUInteger idx, BOOL * _Nonnull stop) {
            if (anim.isNeededPlayed && !anim.isFinished) {
                [anim updt:delta];
            }
            else if(!anim.isNeededPlayed){
                if (self.htTimeOffset >= anim.htBeginTime) {
                    anim.isNeededPlayed = YES;
                    [anim updt:delta];
                }
            }
        }];
        self.htTimeOffset += delta;
    }
    else{
        [self.animations removeAllObjects];
        self.isFinished = YES;
        if (self.htCompletedFuc) {
            self.htCompletedFuc(self.htName);
        }
        
    }
}

@end
