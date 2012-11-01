//
//  PathDrawerViewController.h
//  SinglePathDrawer
//
//  Created by MacBook_2 on 31/10/12.
//  Copyright (c) 2012 MacBook_2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PathDrawerView.h"
#import "PointPathCollection.h"

@interface PathDrawerViewController : UIViewController <PathDrawerViewData, UIGestureRecognizerDelegate>
{
    PathDrawerView          *_pathDrawerView;
    PointPathCollection     *_pointPathCollection;
}

- (void)restartView;
- (void)rotate:(id)sender;
- (void)scaleView:(UIPinchGestureRecognizer *)sender;

@property (nonatomic) PointPathCollection* pointPathCollection;

@end
