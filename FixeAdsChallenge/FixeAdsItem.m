//
//  NSObject+FixeAdsItem.m
//  fixeads-test
//
//  Created by Warzone on 21/06/16.
//  Copyright © 2016 fixeads. All rights reserved.
//

#import "FixeAdsItem.h"

@implementation AdsItem

@synthesize title;
@synthesize description;

- (void) setTitle: (NSString*)input
{
    title = input;
}

- (NSString*) getTitle {
    return title;
}

- (void) setDescription: (NSString*)input
{
    description = input;
}

- (NSString*) getDescription {
 
    
    return description;
}

-(id)initWithJSONData:(NSDictionary*)data{
    self = [super init];
    if(self){
        //NSLog(@"initWithJSONData method called");
        //self.itemId = [[data objectForKey:@"id"] integerValue];
        self.title =  [data objectForKey:@"title"];
        self.description = [data objectForKey:@"description"];
    }
    return self;
}

@end
