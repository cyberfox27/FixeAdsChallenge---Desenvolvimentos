//
//  UIViewController+DetailViewController.h
//  FixeAdsChallenge
//
//  Created by Warzone on 23/06/16.
//  Copyright © 2016 fixeads. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UINavigationController *navbar;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitlelabel;
@property (strong,nonatomic) NSString *titlecontents;
@property (strong,nonatomic) NSString *subtitlecontents;
@end
