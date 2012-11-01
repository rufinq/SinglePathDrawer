//
//  PathDrawerViewController.m
//  SinglePathDrawer
//
//  Created by MacBook_2 on 31/10/12.
//  Copyright (c) 2012 MacBook_2. All rights reserved.
//

#import "PathDrawerViewController.h"
#import "PathDrawerSettings.h"

@interface PathDrawerViewController ()

- (void)loadGestureRecognizer;

@end


@implementation PathDrawerViewController

@synthesize pointPathCollection = _pointPathCollection;

- (id)init
{
    self = [super init];
    if (self) {
        _pointPathCollection = [[PointPathCollection alloc] init];
       // [[PathDrawerSettings sharedInstance] addDelegate:self];
        
        [self loadGestureRecognizer];
        _previousScale = 1.f;
        _previousRotation = 0.f;
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

- (void)rotate:(UIRotationGestureRecognizer *)sender
{
    CGFloat new_value = sender.rotation -  _previousRotation;
    new_value /= 2;
    if (abs(new_value) < 5.f)
    {
        [UIView animateWithDuration:0.15 animations:^{
        self.view.transform = CGAffineTransformMakeRotation(new_value);
        }];
        _previousRotation = new_value;
    }
}

- (void)scaleView:(UIPinchGestureRecognizer *)sender
{
    return ; // to delete
    if (sender.scale > 0.4f && sender.scale <= 3.f)
    {
        CGFloat diff = sender.scale - _previousScale;
        if (diff <= -0.1f)
        {
            diff = -0.1f;
        }
        else if (diff >= 0.1f)
        {
            diff = 0.1f;
        }
        CGFloat newValue = diff / 2 + _previousScale;
        if (newValue < 2.)
        {
            _previousScale = newValue;
            self.view.transform = CGAffineTransformMakeScale(_previousScale, _previousScale);
        }
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return true;
}

@end
