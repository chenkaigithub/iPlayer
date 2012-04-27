//
//  AFAsyncImageView.h
//  iPlayer
//
//  Created by Adam Fraser on 27/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFAsyncImageView : UIImageView {
    NSURLConnection *connection;
    NSMutableData *data;
}

-(void)loadImageFromURL:(NSURL *)url;

@end
