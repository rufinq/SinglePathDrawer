//
//  PathDrawerView.m
//  SinglePathDrawer
//
//  Created by MacBook_2 on 31/10/12.
//  Copyright (c) 2012 MacBook_2. All rights reserved.
//

#import "PathDrawerView.h"
#import "PointPathCollection.h"
#import "PathDrawerSettings.h"

@interface PathDrawerView()

- (void)addPointToCurrentViewController:(PointPath *)point;
- (BOOL)isASuitablePointToAddForTheViewController:(PointPath *)point;
- (void)createNewBezierPath;
- (void)removeAllPointsFromViewController;

@end

@implementation PathDrawerView

@synthesize viewControllerDelegate;
@synthesize color;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.color = [PathDrawerSettings sharedInstance].color;
        [self createNewBezierPath];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andWithDelegate:(id)delegate
{
    self = [self initWithFrame:frame];
    if (self)
    {
        self.viewControllerDelegate = delegate;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    if (_needToClear)
    {
        [self createNewBezierPath];
        return ;
    }
    color = [PathDrawerSettings sharedInstance].color;
    [color setStroke];
    
    [_path strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{   
    UITouch *oneTouch = [[touches allObjects] objectAtIndex:0];
    PointPath *firstPoint = [[PointPath alloc] initWithPoint:[oneTouch locationInView:self]];
    if ([self isASuitablePointToAddForTheViewController:firstPoint] || _firstDraw)
    {
        [self addPointToCurrentViewController:firstPoint];
        _allowedToDisplay = true;
        [_path moveToPoint:[oneTouch locationInView:self]];
        _firstDraw = false;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_allowedToDisplay)
    {
        UITouch *oneTouch = [[touches allObjects] objectAtIndex:0];
        PointPath *currentPoint = [[PointPath alloc] initWithPoint:[oneTouch locationInView:self]];
        [self addPointToCurrentViewController:currentPoint];
        [_path addLineToPoint:[oneTouch locationInView:self]];
        [self setNeedsDisplay];
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _allowedToDisplay = false;
}

- (void)addPointToCurrentViewController:(PointPath *)point
{
    [[self.viewControllerDelegate getPointPathCollection] addPoint:point];
}

- (BOOL)isASuitablePointToAddForTheViewController:(PointPath *)point
{
    return [[self.viewControllerDelegate getPointPathCollection] isASuitablePointToAdd:point];
}

- (void)clean
{
    _needToClear = true;
    [self setNeedsDisplay];
}

- (void)createNewBezierPath
{
    _path = [[UIBezierPath alloc] init];
    _path.lineCapStyle = kCGLineCapRound;
    _path.lineWidth = [PathDrawerSettings sharedInstance].lineWidth;
    _allowedToDisplay = false;
    _firstDraw = true;
    _needToClear = false;
    [self removeAllPointsFromViewController];
}

- (void)removeAllPointsFromViewController
{
    [[self.viewControllerDelegate getPointPathCollection] removeAllPoints];
}

@end
