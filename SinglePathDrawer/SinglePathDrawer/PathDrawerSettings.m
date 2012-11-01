//
//  PathDrawerSettings.m
//  SinglePathDrawer
//
//  Created by MacBook_2 on 31/10/12.
//  Copyright (c) 2012 MacBook_2. All rights reserved.
//

#import "PathDrawerSettings.h"

@implementation PathDrawerSettings

- (id)init
{
    self = [super init];
    if (self)
    {
        self.lineWidth = 4;
        self.color = [UIColor redColor];
        self.currentRowForColor = 0;
    }
    return self;
}

+ (PathDrawerSettings *)sharedInstance
{
    static PathDrawerSettings *sharedInstance = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        if (sharedInstance == nil)
        {
            sharedInstance = [[PathDrawerSettings alloc] init];
        }
    });
    return sharedInstance;
}

@end
