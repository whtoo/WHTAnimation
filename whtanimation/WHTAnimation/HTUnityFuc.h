//
//  HTUnityFuc.h
//  PatternColor
//
//  Created by Arthur on 15/10/26.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface HTUnityFuc : NSObject

CATransform3D htTransAngle(CATransform3D form,CGFloat angle);
CATransform3D htTranslate(CATransform3D form,CGFloat translateW);
CGFloat htInterpolation(CGFloat from,CGFloat to,CGFloat progressVal);
CGFloat htNormarizedProgressVal(CGFloat timeOffSet,CGFloat duration);
float htBounceEaseOut(float t);
float htQuadraticEaseInOut(float p);
@end
