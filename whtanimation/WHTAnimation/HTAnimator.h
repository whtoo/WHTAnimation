//
//  HTAnimator.h
//  PatternColor
//
//  Created by Arthur on 15/10/26.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@class HTSeqAnimations;

@interface HTAnimator : NSObject

@property (assign) float fps;
@property (assign) BOOL repeat;
@property (strong) HTSeqAnimations* sequence;

- (void)startAnim;
- (void)stopAnim;

//TODO:下面2个后面增加
//- (void)pausedAnim;
//- (void)resumAnim;


@end
