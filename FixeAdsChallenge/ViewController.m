//
//  ViewController.m
//  FixeAdsChallenge
//
//  Created by Warzone on 23/06/16.
//  Copyright © 2016 fixeads. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
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
    self.ItemsList.delegate=self;  //use delegate methods of table view
    self.ItemsList.dataSource=self;
    [self.ItemsList registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    titlearrray = [[NSMutableArray alloc]initWithObjects:@"One", @"Two", @"Three",@"Four",@"Five",nil];
    subtitlearray = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3",@"4",@"5",nil];
    
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
