//
//  AFSettingsViewController.m
//  iPlayer
//
//  Created by Adam Fraser on 26/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFSettingsViewController.h"

@interface AFSettingsViewController ()

@end

@implementation AFSettingsViewController
@synthesize usernameLabel;
@synthesize usernameTextbox;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    usernameLabel.text = [defaults objectForKey:@"username"];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload {
    [self setUsernameLabel:nil];
    [self setUsernameTextbox:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)doneEditing:(id)sender {
    [sender resignFirstResponder];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:usernameTextbox.text forKey:@"username"];
    [defaults synchronize];
    [self refreshFields];
}
-(IBAction)backgroundTap:(id)sender {
    [usernameTextbox resignFirstResponder];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:usernameTextbox.text forKey:@"username"];
    [defaults synchronize];
    [self refreshFields];
}

-(void)refreshFields {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    usernameLabel.text = [defaults objectForKey:@"username"];
}

@end
