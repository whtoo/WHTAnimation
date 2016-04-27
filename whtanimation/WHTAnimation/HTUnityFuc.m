//
//  HTUnityFuc.m
//  PatternColor
//
//  Created by Arthur on 15/10/26.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "HTUnityFuc.h"

@implementation HTUnityFuc
CATransform3D htTransAngle(CATransform3D form,CGFloat angle){
    CATransform3D tranform = CATransform3DRotate(form, angle,1, 0, 0);
    return tranform;
}

CATransform3D htTranslate(CATransform3D form,CGFloat translateW){
    CATransform3D tranform = CATransform3DTranslate(form, 0 ,translateW, 0);
    return tranform;
}

CGFloat htInterpolation(CGFloat from,CGFloat to,CGFloat progressVal){
    CGFloat interpolation = (to - from) * progressVal + from;
    return interpolation;
}

CGFloat htNormarizedProgressVal(CGFloat timeOffSet,CGFloat duration){
    return  timeOffSet / duration;
}
//Easing Func
float htBounceEaseOut(float t) {
    if (t < 4/11.0) {
        return (121 * t * t)/16.0; }
    else if (t < 8/11.0) {
        return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0; }
    else if (t < 9/10.0) {
        return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0; }
    return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0 - 0.05;
}

float htQuadraticEaseInOut(float p)
{
    if(p < 0.5)
    {
        return 2 * p * p;
    }
    else
    {
        return (-2 * p * p) + (4 * p) - 1;
    }
}
@end
