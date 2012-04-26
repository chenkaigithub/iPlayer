//
//  AFDetailViewController.h
//  iPlayer
//
//  Created by Elizabeth Howard on 19/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFSharingViewController.h"

@interface AFDetailViewController : UIViewController

@property (strong, nonatomic) AFSharingViewController *sharingView;
@property (strong, nonatomic) IBOutlet UIImageView *imageUnderlay;
@property (nonatomic) int pageNumber;
@property (strong, nonatomic) NSMutableArray *data;
-(id)initWithPageNumber:(int)page;

@end
