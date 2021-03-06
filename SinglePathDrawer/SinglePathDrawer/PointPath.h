//
//  PointPath.h
//  SinglePathDrawer
//
//  Created by MacBook_2 on 31/10/12.
//  Copyright (c) 2012 MacBook_2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PointPath : NSObject
{
    CGPoint _point;
}

- (id)initWithPoint:(CGPoint)point;
- (BOOL)isCloseToPoint:(PointPath *)point withDistance:(CGFloat)distance;

@property CGPoint point;

@end
