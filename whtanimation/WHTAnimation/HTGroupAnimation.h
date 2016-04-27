//
//  HTGroupAnimation.h
//  PatternColor
//
//  Created by Arthur on 15/10/27.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "HTBasicAnimation.h"

@interface HTGroupAnimation : HTBasicAnimation

@property (strong) NSMutableArray<HTBasicAnimation *> *animations;

- (void)addAnimation:(HTBasicAnimation*)anim;
- (void)removeAnimationAtIndex:(int)idx;

@end
