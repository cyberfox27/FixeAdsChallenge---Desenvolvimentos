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
    //self.titlelabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.titlelabel.numberOfLines = 0;
    self.titlelabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
    self.titlelabel.adjustsFontSizeToFitWidth = YES;
    self.titlelabel.minimumScaleFactor = 10.0f/12.0f;
    self.titlelabel.clipsToBounds = YES;
    self.titlelabel.backgroundColor = [UIColor clearColor];
    self.titlelabel.textColor = [UIColor blackColor];
    self.titlelabel.textAlignment = NSTextAlignmentLeft;
    CGSize labelSize = [titlelabel.text sizeWithAttributes:@{NSFontAttributeName:titlelabel.font}];
    
    titlelabel.frame = CGRectMake(
                             titlelabel.frame.origin.x, titlelabel.frame.origin.y,
                             titlelabel.frame.size.width, labelSize.height);
    
    //self.subtitlelabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.subtitlelabel.numberOfLines = 0;
    self.subtitlelabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
    self.subtitlelabel.adjustsFontSizeToFitWidth = YES;
    self.subtitlelabel.minimumScaleFactor = 10.0f/12.0f;
    self.subtitlelabel.clipsToBounds = YES;
    self.subtitlelabel.backgroundColor = [UIColor clearColor];
    self.subtitlelabel.textColor = [UIColor blackColor];
    self.subtitlelabel.textAlignment = NSTextAlignmentLeft;

    CGSize labelSize2 = [subtitlelabel.text sizeWithAttributes:@{NSFontAttributeName:subtitlelabel.font}];
    
    subtitlelabel.frame = CGRectMake(
                                  subtitlelabel.frame.origin.x, subtitlelabel.frame.origin.y,
                                  subtitlelabel.frame.size.width, labelSize2.height);
    
    self.titlelabel.text=self.titlecontents;
    self.subtitlelabel.text=self.subtitlecontents;
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
