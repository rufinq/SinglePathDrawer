//
//  FlipsideViewController.m
//  SinglePathDrawer
//
//  Created by MacBook_2 on 31/10/12.
//  Copyright (c) 2012 MacBook_2. All rights reserved.
//

#import "FlipsideViewController.h"
#import "PathDrawerSettings.h"

@interface FlipsideViewController ()

- (void) applyColor;

@end

@implementation FlipsideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        _colorArray = [[NSArray alloc] initWithObjects: @"red",
                                                        @"darkGray",
                                                        @"gray",
                                                        @"black",
                                                        @"blue",
                                                        @"green",
                                                        @"cyan",
                                                        @"yellow",
                                                        @"magenta",
                                                        @"orange",
                                                        @"purple",
                                                        @"brown",
                                                        nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.colorPickerView.transform = CGAffineTransformMakeScale(0.65f, 0.65f);
    _gestureReconizerSwitch.on = [PathDrawerSettings sharedInstance].activateGestureReconizer;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.colorPickerView reloadAllComponents];
    [self.colorPickerView selectRow:[PathDrawerSettings sharedInstance].currentRowForColor inComponent:0 animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self applyColor];
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _colorArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[_colorArray objectAtIndex:row] capitalizedString];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [PathDrawerSettings sharedInstance].currentRowForColor = row;
    [self applyColor];
}

- (void)applyColor
{
    NSUInteger currentRow = [PathDrawerSettings sharedInstance].currentRowForColor;
    NSString *methodName = [[_colorArray objectAtIndex:currentRow] stringByAppendingString:@"Color"];
    SEL methodForColorChangement = NSSelectorFromString(methodName);
    if ([UIColor respondsToSelector:methodForColorChangement])
    {
        [[PathDrawerSettings sharedInstance] setColor:[UIColor performSelector:methodForColorChangement]];
    }
}

- (IBAction)gestureReconizerSwitched:(UISwitch *)sender
{
    [PathDrawerSettings sharedInstance].activateGestureReconizer = sender.on;
}

@end
