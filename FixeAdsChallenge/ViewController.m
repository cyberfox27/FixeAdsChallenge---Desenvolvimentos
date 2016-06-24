//
//  ViewController.m
//  FixeAdsChallenge
//
//  Created by Warzone on 23/06/16.
//  Copyright © 2016 fixeads. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "FixeAdsItem.h"

@interface ViewController ()
{
    NSMutableArray *titlearrray;
    NSMutableArray *subtitlearray;
    int currentIndex;
}

@end

@implementation ViewController
@synthesize ItemsList;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"https://olx.pt/i2/ads/?json=1&search[category_id]=25"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    //NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSMutableArray *dict2 = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    //response object is your response from server as NSData
    
    NSMutableArray* instances = [[NSMutableArray alloc] init];
    //[instances addObject: foo];
    //[instances addObject: bar];
    // etc. mutable arrays grow as you add elements to them
    
    //[[instances objectAtIndex: i] setVar: 10];
    
    //NSLog(@"json: %@", dict);
    
    //NSString *categoryId = [dict valueForKey:@"category_id"];
    
    //NSLog(@"%@",dict);
    
    //NSLog(@"\ncategory_id is %@", categoryId);
    
    
    //matches array
    NSArray *matches = [dict valueForKey: @"ads"];
    
    long n = [matches count];
    
    titlearrray = [[NSMutableArray alloc]init];
    subtitlearray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < [matches count]; i++)
    {
        AdsItem *item = [[AdsItem alloc] init];
        NSDictionary *Dic =[[NSDictionary alloc]init];
        Dic=[matches objectAtIndex:i];
        
        NSString *title=[NSString stringWithFormat:@"%@",[Dic objectForKey:@"title"]];
        NSString *description=[NSString stringWithFormat:@"%@",[Dic objectForKey:@"description"]];
        
        //item.title = title;
        //item.description = description;
        
        [titlearrray addObject:title];
        [subtitlearray addObject:description];

    }


//    item.categoryId = [dict 	valueForKey:@"category_id"];
//    item.params = [dict 	valueForKey:@"params"];
//    
//    NSLog(@"\ncategory_id on array is %@", item.getCategoryId);
//    NSLog(@"\params on array is %@", item.getParams);
//    NSLog(@"vetor: %@", matches);
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    self.ItemsList.delegate=self;  //use delegate methods of table view
    self.ItemsList.dataSource=self;
    [self.ItemsList registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    
    //titlearrray = [[NSMutableArray alloc] valuesfor];
    
    //subtitlearray = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3",@"4",@"5",nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//one section on table view
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //with same number of objects
    return [titlearrray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    //Populate tableview with array contents
    cell.textLabel.text = [titlearrray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [subtitlearray objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    currentIndex = indexPath.row;
    [self performSegueWithIdentifier:@"detailSegue" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"detailSegue"]){
        DetailViewController *destination = segue.destinationViewController;
        if (destination != nil) {
            destination.title = [titlearrray objectAtIndex:currentIndex];
            destination.titlecontents = destination.titlelabel.text = [titlearrray objectAtIndex:currentIndex];
            destination.subtitlecontents = destination.subtitlelabel.text = [subtitlearray objectAtIndex:currentIndex];
        }
        
        
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
