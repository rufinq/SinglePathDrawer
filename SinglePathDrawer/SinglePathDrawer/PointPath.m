//
//  PointPath.m
//  SinglePathDrawer
//
//  Created by MacBook_2 on 31/10/12.
//  Copyright (c) 2012 MacBook_2. All rights reserved.
//

#import "PointPath.h"

@implementation PointPath

@synthesize point = _point;

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)initWithPoint:(CGPoint)point
{
    self = [super init];
    if (self) {
        _point = point;
    }
    return self;
}

- (BOOL)isCloseToPoint:(PointPath *)point withDistance:(NSUInteger)distance
{
    NSInteger x_distance = abs(point.point.x - _point.x);
    NSInteger y_distance = abs(point.point.y - _point.y);
    if (x_distance <= distance && y_distance <= distance)
        return true;
    return false;
}

@end
