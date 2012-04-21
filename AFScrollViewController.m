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
@synthesize scrollView = _scrollView;
@synthesize pageControl;
@synthesize viewControllers;
@synthesize pageControlUsed;

static int NumberOfPages = 15;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (int i = 0; i < NumberOfPages; i++) {
        [controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
    
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * NumberOfPages, _scrollView.frame.size.height);
    pageControl.numberOfPages = NumberOfPages;
    pageControl.currentPage = 0;
        
    _scrollView.backgroundColor = [UIColor clearColor];
    [self loadScrollViewWithPage:0];
}


-(void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page > NumberOfPages) return;
    
    AFDetailViewController *pageView = [viewControllers objectAtIndex:page];
    if ((NSNull *)pageView == [NSNull null]) {
        pageView = [[AFDetailViewController alloc] initWithPageNumber:page];
        [viewControllers replaceObjectAtIndex:page withObject:pageView];
    }
        
    [_scrollView addSubview:pageView.view];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (pageControlUsed) {
        return;
    }
    // Set page control to correct page
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
    
    [self loadScrollViewWithPage:page -1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}

- (IBAction)changePage:(id)sender {
    int page = pageControl.currentPage;
    [self loadScrollViewWithPage:page -1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
    CGRect frame = _scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;

    [_scrollView scrollRectToVisible:frame animated:YES];
}



- (void)viewDidUnload {
    viewControllers = nil;
    _scrollView = nil;
    viewControllers = nil;
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
