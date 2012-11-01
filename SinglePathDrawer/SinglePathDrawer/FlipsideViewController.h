//
//  FlipsideViewController.h
//  SinglePathDrawer
//
//  Created by MacBook_2 on 31/10/12.
//  Copyright (c) 2012 MacBook_2. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray             *_colorArray;
    IBOutlet UISwitch   *_gestureReconizerSwitch;
}

- (IBAction)done:(id)sender;
- (IBAction)gestureReconizerSwitched:(id)sender;

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIPickerView *colorPickerView;


@end
