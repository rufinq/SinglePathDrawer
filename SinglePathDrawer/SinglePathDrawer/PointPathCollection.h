//
//  PointPathCollection.h
//  SinglePathDrawer
//
//  Created by MacBook_2 on 31/10/12.
//  Copyright (c) 2012 MacBook_2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PointPath.h"

@interface PointPathCollection : NSObject
{
    NSMutableSet *_pointPathCollection;
}

- (BOOL)isASuitablePointToAdd:(PointPath *)point;
- (void)addPoint:(PointPath *)point;
- (void)removeAllPoints;

+ (NSUInteger)defaultDistanceBetweenTwoPoints;

@end
