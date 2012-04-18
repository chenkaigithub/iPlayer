//
//  AFStory.m
//  iPlayer
//
//  Created by Adam Fraser on 18/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFStory.h"

@implementation AFStory
@synthesize storyURL;
@synthesize title;
@synthesize videoOriginalURL;
@synthesize imageURL;
@synthesize detail;
@synthesize timeStamp;
@synthesize familyFriendly;
@synthesize duration;
@synthesize videoQuality0;
@synthesize videoQuality1;
@synthesize videoQuality2;
@synthesize videoQuality3;
@synthesize videoQuality4;



-(id)initWithDictionary:(NSDictionary *)details{
    NSURL *url = [[NSURL alloc] initWithString:[details valueForKey:@"loc"]];
    self.storyURL = url;
    
    self.title = [details valueForKey:@"title"];
    
    NSURL *videoURL = [[NSURL alloc] initWithString:[details valueForKey:@"original"]];
    self.videoOriginalURL = videoURL;
    
    NSURL *image = [[NSURL alloc] initWithString:[details valueForKey:@"image"]];
    self.imageURL = image;
    
    self.detail = [details valueForKey:@"detail"];
    // Convert strings to correct values
    
    self.timeStamp = [details valueForKey:@"timeStamp"];
    self.familyFriendly = [details valueForKey:@"familyFriendly"];
    self.duration = [details valueForKey:@"duration"];
    
    NSURL *qualityURL = [[NSURL alloc] initWithString:[details valueForKey:@"url0"]];
    self.videoQuality0 = qualityURL;
    qualityURL = [[NSURL alloc] initWithString:[details valueForKey:@"url1"]];
    self.videoQuality1 = qualityURL;
    qualityURL = [[NSURL alloc] initWithString:[details valueForKey:@"url1"]];
    self.videoQuality2 = qualityURL;
    qualityURL = [[NSURL alloc] initWithString:[details valueForKey:@"url1"]];
    self.videoQuality3 = qualityURL;
    qualityURL = [[NSURL alloc] initWithString:[details valueForKey:@"url1"]];
    self.videoQuality4 = qualityURL;
    return self;
}
@end
