//
//  HTSeqAnimations.h
//  PatternColor
//
//  Created by Arthur on 15/10/26.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTBasicAnimation.h"

@interface HTSeqAnimations : HTBasicAnimation

@property (strong) NSMutableArray<HTBasicAnimation *> *animations;
- (void)addAnimation:(HTBasicAnimation*)anim;
@end
