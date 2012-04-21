//
//  AFDetailViewController.m
//  iPlayer
//
//  Created by Elizabeth Howard on 19/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFDetailViewController.h"
#import "AFAppDelegate.h"
@class AFCategory;
@interface AFDetailViewController ()

@end


@implementation AFDetailViewController
@synthesize imageButton;
@synthesize storyParagraph;
@synthesize storyHeadline;
@synthesize imageUnderlay;
@synthesize pageNumber;
@synthesize data;

-(id)initWithPageNumber:(int)page {
    if (self = [super initWithNibName:@"AFDetailView" bundle:nil]) {
        pageNumber = page;   
    }    
    AFAppDelegate *appDelegate = (AFAppDelegate *)[[UIApplication sharedApplication] delegate];
    AFCategory *news = [appDelegate.categoryList objectForKey:@"smhNews"];
    data = news.stories;

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    storyParagraph.text = [NSString stringWithFormat:@"%d", pageNumber];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[[data objectAtIndex:pageNumber] imageURL]]];
    [imageButton setBackgroundImage:image forState:normal];
    imageUnderlay.image = [UIImage imageNamed:@"imageUnderlay"];
   
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setStoryParagraph:nil];
    [self setStoryHeadline:nil];
    [self setImageUnderlay:nil];
    [self setImageUnderlay:nil];
    [self setImageButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
