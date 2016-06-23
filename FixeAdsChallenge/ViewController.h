//
//  ViewController.h
//  FixeAdsChallenge
//
//  Created by Warzone on 23/06/16.
//  Copyright © 2016 fixeads. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *ItemsList;


@end

