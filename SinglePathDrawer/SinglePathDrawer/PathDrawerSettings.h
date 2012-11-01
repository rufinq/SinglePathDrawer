//
//  PathDrawerSettings.h
//  SinglePathDrawer
//
//  Created by MacBook_2 on 31/10/12.
//  Copyright (c) 2012 MacBook_2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PathDrawerViewController.h"

@interface PathDrawerSettings : NSObject 

+ (PathDrawerSettings *)sharedInstance;

@property (atomic) UIColor* color;
@property (atomic) CGFloat lineWidth;
@property (atomic) NSUInteger currentRowForColor;

@end
