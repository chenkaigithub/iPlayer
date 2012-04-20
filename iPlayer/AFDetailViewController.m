//
//  AFDetailViewController.m
//  iPlayer
//
//  Created by Elizabeth Howard on 19/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFDetailViewController.h"

@interface AFDetailViewController ()

@end

@implementation AFDetailViewController
@synthesize image;
@synthesize storyParagraph;
@synthesize storyHeadline;
@synthesize imageUnderlay;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    storyParagraph.text = @"This is fake text about how much apple stocks are rising. I really wish that I had bought some back in 2004 or sometime like that it would have been awesome... But no oh well.. I guess I could buy some now or maybe in a few years. I would like a job at square for a couple of years before they IPO I wonder if you can still get employee stock options?";
    storyHeadline.text = @"Apple Stocks Rising?";
    image.image = [UIImage imageNamed:@"testCell.png"];
    imageUnderlay.image = [UIImage imageNamed:@"imageUnderlay"];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setImage:nil];
    [self setStoryParagraph:nil];
    [self setStoryHeadline:nil];
    [self setImageUnderlay:nil];
    [self setImageUnderlay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
