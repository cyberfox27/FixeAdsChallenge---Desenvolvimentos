//
//  UIViewController+DetailViewController.m
//  FixeAdsChallenge
//
//  Created by Warzone on 23/06/16.
//  Copyright © 2016 fixeads. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end


@implementation DetailViewController
@synthesize titlelabel;
@synthesize subtitlelabel;
@synthesize navbar;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        //custom initialization
    }
    return self;
}

- (void) viewDidLoad
{

    [super viewDidLoad];
    self.titlelabel.text=self.titlecontents;
    self.subtitlelabel.text=self.subtitlecontents;
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
