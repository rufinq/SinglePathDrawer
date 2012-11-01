//
//  MainViewController.h
//  SinglePathDrawer
//
//  Created by MacBook_2 on 31/10/12.
//  Copyright (c) 2012 MacBook_2. All rights reserved.
//

#import "FlipsideViewController.h"
#import "PathDrawerViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>
{
    PathDrawerViewController *_pathDrawerViewController;
}
@property (strong, nonatomic) IBOutlet UIButton *iButton;

- (IBAction)showInfo:(id)sender;

- (IBAction)clearButtonPressed;

@end
