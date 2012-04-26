//
//  AFSharingViewController.m
//  iPlayer
//
//  Created by Adam Fraser on 24/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFSharingViewController.h"

@interface AFSharingViewController ()

@end

@implementation AFSharingViewController
@synthesize button1;
@synthesize button2;
@synthesize button3;
@synthesize button4;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [button1 setBackgroundImage:[UIImage imageNamed:@"shareTwitter"] forState:UIControlStateNormal];
    [button2 setBackgroundImage:[UIImage imageNamed:@"shareFacebook"] forState:UIControlStateNormal];
    [button3 setBackgroundImage:[UIImage imageNamed:@"shareMail"] forState:UIControlStateNormal];
    [button4 setBackgroundImage:[UIImage imageNamed:@"shareOnline"] forState:UIControlStateNormal];
}


- (void)viewDidUnload {
    [self setButton1:nil];
    [self setButton2:nil];
    [self setButton3:nil];
    [self setButton4:nil];
    [super viewDidUnload];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)buttonTouched:(id)sender {
    NSLog(@"Test!");
}
@end
