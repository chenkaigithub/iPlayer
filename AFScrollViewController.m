//
//  AFScrollViewController.m
//  iPlayer
//
//  Created by Elizabeth Howard on 19/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFScrollViewController.h"

@interface AFScrollViewController ()

@end

@implementation AFScrollViewController
@synthesize scrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    AFDetailViewController *detailView = [[AFDetailViewController alloc] initWithNibName:@"AFDetailView" bundle:nil];
    
    [scrollView addSubview:detailView.view];
    [scrollView addSubview:detailView.view];
    [scrollView addSubview:detailView.view];

	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
