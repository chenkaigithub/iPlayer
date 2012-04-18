//
//  AFStory.h
//  iPlayer
//
//  Created by Adam Fraser on 18/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFStory : NSObject

@property (strong, nonatomic) NSURL * storyURL;             // <key>loc</key>
@property (strong, nonatomic) NSString * title;             // <key>title</key>
@property (strong, nonatomic) NSURL * videoOriginalURL;     // <key>original</key>
@property (strong, nonatomic) NSURL * imageURL;             // <key>image</key>
@property (strong, nonatomic) NSString * detail;            // <key>detail</key>
@property (strong, nonatomic) NSString * timeStamp;         // <key>date</key>
@property (strong, nonatomic) NSString * familyFriendly;    // <key>familyFriendly</key>
@property (strong, nonatomic) NSString * duration;          // <key>duration</key>
@property (strong, nonatomic) NSURL * videoQuality4;        // <key>url4</key>
@property (strong, nonatomic) NSURL * videoQuality3;        // <key>url3</key>
@property (strong, nonatomic) NSURL * videoQuality2;        // <key>url2</key>
@property (strong, nonatomic) NSURL * videoQuality1;        // <key>url1</key>
@property (strong, nonatomic) NSURL * videoQuality0;        // <key>url0</key>

-(id)initWithDictionary:(NSDictionary *)details;
@end
