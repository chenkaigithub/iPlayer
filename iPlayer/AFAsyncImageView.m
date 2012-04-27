//
//  AFAsyncImageView.m
//  iPlayer
//
//  Created by Adam Fraser on 27/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFAsyncImageView.h"

@implementation AFAsyncImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)loadImageFromURL:(NSURL *)url {
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)incrementalData {
    if (data == nil) {
        data = [[NSMutableData alloc] initWithCapacity:2048];
        [data appendData:incrementalData];
    }
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    self.image = [UIImage imageWithData:data];
}

@end
