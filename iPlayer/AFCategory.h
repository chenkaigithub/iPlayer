//
//  AFCategory.h
//  iPlayer
//
//  Created by Adam Fraser on 18/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFStory.h"

@interface AFCategory : NSObject
@property (strong, nonatomic) NSString *categoryName;
@property (strong, nonatomic) NSMutableArray *stories;

-(id)initWithName:(NSString *)name andURL:(NSURL *)url;
@end
