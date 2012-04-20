//
//  AFDetailViewController.h
//  iPlayer
//
//  Created by Elizabeth Howard on 19/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UITextView *storyParagraph;
@property (strong, nonatomic) IBOutlet UILabel *storyHeadline;
@property (strong, nonatomic) IBOutlet UIImageView *imageUnderlay;

@end
