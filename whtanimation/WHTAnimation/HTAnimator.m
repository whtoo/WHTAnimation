//
//  HTAnimator.m
//  PatternColor
//
//  Created by Arthur on 15/10/26.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "HTAnimator.h"
#import "HTBasicAnimation.h"
#import "HTSeqAnimations.h"

@interface HTAnimator ()
@property (strong) NSTimer* timer;

@end

@implementation HTAnimator
- (instancetype)init{
    self = [super init];
    if (self) {
        self.fps = 2 / 60.0f;
    }
    return self;
}
- (void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"dealloc self HTAnimator");
}
- (void)addAnimTimer{
    [self removeAnimTimer];
    
    self.timer = [NSTimer timerWithTimeInterval:self.fps target:self selector:@selector(updtAnimPerFrame:) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)updtAnimPerFrame:(NSTimer*)timer{
    if (self.sequence) {
        
        HTBasicAnimation* anim = [self.sequence.animations firstObject];
        if (!anim.isFinished) {
            [anim updt:self.fps];
            if (anim.isFinished) {
                if (self.sequence.animations.count == 0) {
                    [self stopAnim];
                    self.sequence.htCompletedFuc(self.sequence.htName);
                }
            }
           
        }
        else{
            [self.sequence.animations removeObject:anim];
            if (self.sequence.animations.count == 0) {
                [self stopAnim];
                self.sequence.htCompletedFuc(self.sequence.htName);
            }
        }
    }
   
}

- (void)removeAnimTimer{
    if (self.timer && [self.timer isValid]) {
        [self.timer invalidate];

    }
    self.timer = nil;
}

- (void)startAnim{
    [self addAnimTimer];
}

- (void)stopAnim{
    [self removeAnimTimer];
}
@end
