//
//  AFSharingViewController.h
//  iPlayer
//
//  Created by Adam Fraser on 24/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFSharingViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;

- (IBAction)buttonTouched:(id)sender;
@end
