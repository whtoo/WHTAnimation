//
//  HTBasicAnimation.m
//  PatternColor
//
//  Created by Arthur on 15/10/26.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "HTBasicAnimation.h"
#import "HTAnimator.h"
#import "HTUnityFuc.h"

@interface HTBasicAnimation ()


@end



@implementation HTBasicAnimation

- (void)setUpBegin{

}

- (void)dealloc{
    NSLog(@"HTBasicAnimation dealloc %@",self.htName);
}

- (void)updt:(NSTimeInterval)delta{
    if (self.htTimeOffset == 0.0) {
        if (self.htBeginFunc) {
            self.htBeginFunc();
        }
    }
    
    self.htTimeOffset += delta;
    CGFloat normorizedProg = htNormarizedProgressVal(self.htTimeOffset, self.htDuration);
    if (self.htTimeOffset < self.htDuration) {
       
        if (self.htUpdateFunc) {
            self.htUpdateFunc(normorizedProg);
        }
        else if(self.htEaseFunc && self.refLayer){
            NSValue* val = self.htEaseFunc(normorizedProg);
            
            [self.refLayer setValue:val forKeyPath:self.htKeyPathVal];
        }
        else{
            NSLog(@"");
        }
    }
    else{
        self.isFinished = YES;
        if (self.htCompletedFuc) {
            self.htCompletedFuc(self.htName);
        }
    }
}

@end
