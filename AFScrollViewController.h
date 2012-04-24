//
//  AFScrollViewController.h
//  iPlayer
//
//  Created by Elizabeth Howard on 19/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFDetailViewController.h"

@interface AFScrollViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic) BOOL pageControlUsed;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) NSMutableArray *viewControllers;
@property (nonatomic) NSInteger pageNumber;
-(void)loadScrollViewWithPage:(int)page;


@end
