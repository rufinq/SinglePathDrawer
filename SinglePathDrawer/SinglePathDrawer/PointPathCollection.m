//
//  PointPathCollection.m
//  SinglePathDrawer
//
//  Created by MacBook_2 on 31/10/12.
//  Copyright (c) 2012 MacBook_2. All rights reserved.
//

#import "PointPathCollection.h"

@implementation PointPathCollection

- (id)init
{
    self = [super init];
    if (self) {
        _pointPathCollection = [[NSMutableSet alloc] init];
    }
    return self;
}

- (BOOL)isASuitablePointToAdd:(PointPath *)point
{
    const NSUInteger distance = [PointPathCollection defaultDistanceBetweenTwoPoints];
    
    for (PointPath *currentPoint in _pointPathCollection)
    {
        if ([point isCloseToPoint:currentPoint withDistance:distance])
            return true;
    }
    return false;
}

- (void)addPoint:(PointPath *)point
{
    [_pointPathCollection addObject:point];
}

- (void)addManyPoints:(NSArray *)array
{
    [_pointPathCollection addObjectsFromArray:array];
}

- (void)removeAllPoints
{
    [_pointPathCollection removeAllObjects];
}

+ (NSUInteger)defaultDistanceBetweenTwoPoints
{
    return 5;
}

@end
