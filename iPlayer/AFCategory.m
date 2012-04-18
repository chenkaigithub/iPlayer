//
//  AFCategory.m
//  iPlayer
//
//  Created by Adam Fraser on 18/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFCategory.h"
@class AFStory;

@implementation AFCategory
@synthesize categoryName;
@synthesize stories;

-(id)initWithName:(NSString *)name andURL:(NSURL *)url {
    self.categoryName = name;
    NSMutableArray *contents = [[NSMutableArray alloc] initWithContentsOfURL:url];
    self.stories = [[NSMutableArray alloc] init];
    NSEnumerator *e = [contents objectEnumerator];
    id object;
    while (object = [e nextObject] ) {
        AFStory *story = [[AFStory alloc] initWithDictionary:object];
        [self.stories addObject:story];
    }
    return self;
}
@end
