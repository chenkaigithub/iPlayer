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
@synthesize imageUnderlay;
@synthesize pageNumber;
@synthesize data;
@synthesize sharingView;

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
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[[data objectAtIndex:pageNumber] imageURL]]];
    imageUnderlay.image = [UIImage imageNamed:@"imageUnderlay"];
    
    UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageButton setBackgroundImage:image forState:UIControlStateNormal];
    [imageButton setFrame:CGRectMake(25, 20, 270, 162)];
    [self.view addSubview:imageButton];
    
    UILabel *storyHeadline = [[UILabel alloc] initWithFrame:CGRectMake(40, 185, 240, 80)];
    storyHeadline.text = [[data objectAtIndex:pageNumber] title];
    storyHeadline.numberOfLines = 0;
    storyHeadline.textAlignment = UITextAlignmentCenter;
    [storyHeadline setBackgroundColor:[UIColor clearColor]];
    [storyHeadline setFont:[UIFont boldSystemFontOfSize:20]];
    
    UIImageView *underline = [[UIImageView alloc] initWithFrame:CGRectMake(40, 180 + storyHeadline.frame.size.height, 240, 1)];
    [underline setImage:[UIImage imageNamed:@"titleUnderline"]];
    [self.view addSubview:underline];

    
    UILabel *storyParagraph = [[UILabel alloc]initWithFrame:CGRectMake(40, 205 + storyHeadline.frame.size.height, 250, 200)];
    storyParagraph.text = [[data objectAtIndex:pageNumber] detail];
    storyParagraph.numberOfLines = 0;
    [storyParagraph sizeToFit];
    [storyParagraph setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:storyParagraph];
    [self.view addSubview:storyHeadline];
}

- (void)viewDidUnload {

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
