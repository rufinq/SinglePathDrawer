//
//  PathDrawerView.h
//  SinglePathDrawer
//
//  Created by MacBook_2 on 31/10/12.
//  Copyright (c) 2012 MacBook_2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PathDrawerViewData.h"

@interface PathDrawerView : UIView
{
    @protected
    UIBezierPath    *_path;
    BOOL            _allowedToDisplay;
    BOOL            _firstDraw;
    BOOL            _needToClear;
}

- (id)initWithFrame:(CGRect)frame andWithDelegate:(id)delegate;
- (void)clean;

@property (assign) id <PathDrawerViewData> viewControllerDelegate;
@property UIColor *color;

@end
