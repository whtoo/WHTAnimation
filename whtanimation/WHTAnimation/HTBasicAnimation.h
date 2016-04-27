//
//  HTBasicAnimation.h
//  PatternColor
//
//  Created by Arthur on 15/10/26.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

//FIXME:后面分离
typedef NSValue* (^HTEasingFunc)(float);
typedef void(^HTUpdtFunc)(float);
typedef void (^HTBeginFunc)(void);
typedef void (^HTFinishedFunc)(NSString* name);
@interface HTBasicAnimation : NSObject

@property (strong) id htFromVal;
@property (strong) id htToVal;
@property (assign) BOOL isLooped;//是否循环
@property (copy) NSString* htName;
@property (assign) BOOL isNeededPlayed;//是否可以进行动画
@property (assign) CGFloat htBeginTime;//时间offset
@property (assign) CGFloat htTimeOffset;//当前动画剩余时间
@property (assign) CGFloat htDuration;//时间长度
@property (copy) NSString* htKeyPathVal;
@property (copy) HTEasingFunc htEaseFunc;//t -> lerp(t)
@property (copy) HTUpdtFunc htUpdateFunc;//
@property (copy) HTFinishedFunc htCompletedFuc;
@property (copy) HTBeginFunc htBeginFunc;
@property (assign)  BOOL isFinished;
@property (weak) CALayer* refLayer;
- (void)setUpBegin;
- (void)updt:(NSTimeInterval)delta;
@end
