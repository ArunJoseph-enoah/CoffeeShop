//
//  CSTableViewController.m
//  CoffeeShop
//
//  Created by Arun Joseph on 28/08/15.
//  Copyright (c) 2015 enoah. All rights reserved.
//

#import "CSTableViewController.h"
#import "CSMapViewController.h"

@interface CSTableViewController ()

@end

@implementation CSTableViewController

@synthesize locationManager_;
@synthesize csDataArr_;
@synthesize csTableView_;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    csDataArr_ = [[NSMutableArray alloc] init];
    csCore_ = [[CSCore alloc] init];
    csCore_.delegate_ = self;
    self.title = @"Coffee Shops";
    
    if(!loadingView_)
    {
        loadingView_ = [[UIView alloc] initWithFrame:self.view.frame];
        [loadingView_ setBackgroundColor:[UIColor clearColor]];
        
        UIActivityIndicatorView *actInd = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        actInd.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-20.0)/2, ([[UIScreen mainScreen] bounds].size.height-20.0)/2, 20.0, 20.0);
        [loadingView_ addSubview:actInd];
        [actInd startAnimating];
    }
    
    [self.csTableView_ addSubview:loadingView_];
    
    self.locationManager_ = [[CLLocationManager alloc] init];
    self.locationManager_.delegate = self;
    self.locationManager_.distanceFilter = kCLDistanceFilterNone;
    self.locationManager_.desiredAccuracy = kCLLocationAccuracyBest;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        [self.locationManager_ requestWhenInUseAuthorization];
    
    [self.locationManager_ startUpdatingLocation];
}

-(void)viewWillAppear:(BOOL)animated
{
   
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*Core location delegate method*/

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSString *latitude = [NSString stringWithFormat:@"%f", newLocation.coordinate.latitude];
    NSString *longitude = [NSString stringWithFormat:@"%f", newLocation.coordinate.longitude];
    [csCore_ getLocationForLatitude:latitude Longitude:longitude];
}

/* TableView delegate methods */

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.csDataArr_ count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    
    CSData *data = [self.csDataArr_ objectAtIndex:indexPath.row];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 250.0, 30.0)];
    title.text = data.venueName_;
    title.font = [UIFont fontWithName:@"Helvetica" size:14.0];
    
    UILabel *subTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 30.0, 260.0, 30.0)];
    subTitle.text = data.venueAddress_;
    subTitle.numberOfLines = 2;
    subTitle.font = [UIFont fontWithName:@"Helvetica-Light" size:12.0];
    
    UIView *contentView = [[UIView alloc] initWithFrame:cell.frame];
    [contentView addSubview:title];
    [contentView addSubview:subTitle];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [cell.contentView addSubview:contentView];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CSMapViewController *csMapViewController = [[CSMapViewController alloc] initWithNibName:@"CSMapView" bundle:nil];
    csMapViewController.data_ = [csDataArr_ objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:csMapViewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

/* Table View delegate methods ends here */

/* Delegate response handler for CSDataReceivedDelegate */
-(void)didReceivedLocation:(NSMutableArray *)locDataArr
{
    self.csDataArr_ = locDataArr;
    [self.csTableView_ reloadData];
    [loadingView_ removeFromSuperview];
}

@end
