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
@synthesize pageNumber;
@synthesize shareView;

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
    _scrollView.delegate = self;
    
    if (pageNumber == 0) {
        [self loadScrollViewWithPage:pageNumber];
        [self loadScrollViewWithPage:pageNumber+1];
    }
    
    CGRect frame = _scrollView.frame;
    frame.origin.x = frame.size.width * pageNumber;
    frame.origin.y = 0;
    
    [_scrollView scrollRectToVisible:frame animated:NO];
    
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeUp:)];
    swipeUp.direction = (UISwipeGestureRecognizerDirectionUp);
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeDown:)];
    swipeDown.direction = (UISwipeGestureRecognizerDirectionDown);
    
    for (UIGestureRecognizer *gesture in self.view.gestureRecognizers) {
        [gesture requireGestureRecognizerToFail:swipeUp];
        [gesture requireGestureRecognizerToFail:swipeDown];
    }  
    
    [self.view addGestureRecognizer:swipeUp];
    [self.view addGestureRecognizer:swipeDown];

}

-(IBAction)handleSwipeUp:(id)sender {
    CGAffineTransform moveUp = CGAffineTransformMakeTranslation(0, 0);
    CGFloat pageWidth = _scrollView.frame.size.width;
    int page = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    NSArray *viewarray = _scrollView.subviews;
    for (UIView *currentView in viewarray) {
        if (currentView.tag == page) {
            [currentView setTransform:moveUp];
        }
    }
    
    UIView *viewmove = [viewarray objectAtIndex:page];
    [viewmove setTransform:moveUp];
    
}

-(IBAction)handleSwipeDown:(id)sender {
    CGAffineTransform moveDown = CGAffineTransformMakeTranslation(0, 100);
    CGFloat pageWidth = _scrollView.frame.size.width;
    int page = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    NSArray *viewarray = _scrollView.subviews;
    for (UIView *currentView in viewarray) {
        if (currentView.tag == page) {
            [currentView setTransform:moveDown];
        }
    }
}



-(void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page >= NumberOfPages) return;
    
    AFDetailViewController *pageView = [viewControllers objectAtIndex:page];
    if ((NSNull *)pageView == [NSNull null]) {
        pageView = [[AFDetailViewController alloc] initWithPageNumber:page];
        [viewControllers replaceObjectAtIndex:page withObject:pageView];
    }
    
    if (pageView.view.superview == nil) {
        CGRect frame = _scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        pageView.view.frame = frame;
        shareView = [[AFSharingViewController alloc] initWithNibName:@"AFSharingView" bundle:nil];
        shareView.view.frame = frame;
        [pageView.view setTag:page];
        [_scrollView addSubview:shareView.view];
        [_scrollView addSubview:pageView.view];
    }
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
    pageControlUsed = YES;

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
