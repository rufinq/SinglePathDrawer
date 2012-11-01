//
//  PathDrawerViewController.m
//  SinglePathDrawer
//
//  Created by MacBook_2 on 31/10/12.
//  Copyright (c) 2012 MacBook_2. All rights reserved.
//

#import "PathDrawerViewController.h"
#import "PathDrawerSettings.h"

@interface PathDrawerViewController()

- (void)loadGestureRecognizer;

@end


@implementation PathDrawerViewController

@synthesize pointPathCollection = _pointPathCollection;

- (id)init
{
    self = [super init];
    if (self)
    {
        _pointPathCollection = [[PointPathCollection alloc] init];
        [self loadGestureRecognizer];
    }
    return self;
}

- (void)loadView
{
    self.view = [[PathDrawerView alloc] initWithFrame:CGRectMake(0, 60, 350, 400) andWithDelegate:self];
}

- (PointPathCollection *)getPointPathCollection
{
    return _pointPathCollection;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)restartView
{
    if ([self.view isKindOfClass:[PathDrawerView class]])
        [(PathDrawerView *)self.view clean];
    self.view.transform = CGAffineTransformMakeScale(1.f, 1.f);
}

- (void)loadGestureRecognizer
{
    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
    [rotationRecognizer setDelegate:self];
    [self.view addGestureRecognizer:rotationRecognizer];
    
    UIPinchGestureRecognizer *pinchRecongnizer = [[UIPinchGestureRecognizer alloc]
                                                  initWithTarget:self action:@selector(scaleView:)];
    [pinchRecongnizer setDelegate:self];
    [self.view addGestureRecognizer:pinchRecongnizer];
}

- (void)rotate:(UIRotationGestureRecognizer *)gestureRecognizer
{
    if ([PathDrawerSettings sharedInstance].activateGestureReconizer == false)
        return;
    gestureRecognizer.view.transform = CGAffineTransformRotate(gestureRecognizer.view.transform, gestureRecognizer.rotation);
    gestureRecognizer.rotation = 0.;
}

- (void)scaleView:(UIPinchGestureRecognizer *)gestureRecognizer
{
    if ([PathDrawerSettings sharedInstance].activateGestureReconizer == false)
        return;
    gestureRecognizer.view.transform = CGAffineTransformScale(gestureRecognizer.view.transform, gestureRecognizer.scale, gestureRecognizer.scale);
    gestureRecognizer.scale = 1;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return true;
}

@end
