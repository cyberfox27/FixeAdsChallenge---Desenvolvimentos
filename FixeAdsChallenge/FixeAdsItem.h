//
//  NSObject+FixeAdsItem.h
//  fixeads-test
//
//  Created by Warzone on 21/06/16.
//  Copyright © 2016 fixeads. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdsItem : NSObject
{
NSString *title;
NSString *description;

}

-(id)initWithJSONData:(NSDictionary*)data;

@property (strong) NSString *title;
@property (strong) NSString *description;

- (NSString*) getTitle;
- (NSString*) getDescription;

- (void) setTitle: (NSString*)title;
- (void) setDescription: (NSString*)description;

@end
