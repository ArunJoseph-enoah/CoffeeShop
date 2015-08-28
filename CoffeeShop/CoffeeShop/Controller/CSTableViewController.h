//
//  CSTableViewController.h
//  CoffeeShop
//
//  Created by Arun Joseph on 28/08/15.
//  Copyright (c) 2015 enoah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSData.h"
#import "CSCore.h"
#import <CoreLocation/CoreLocation.h>

@interface CSTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate, CSDataReceivedDelegate>
{
    IBOutlet UITableView *csTableView_;
    NSMutableArray *csDataArr_;
    CLLocationManager *locationManager_;
    CSCore *csCore_;
    UIView *loadingView_;
}

@property(nonatomic, retain)NSMutableArray *csDataArr_;
@property(nonatomic, retain)CLLocationManager *locationManager_;

@property (nonatomic, retain)IBOutlet UITableView *csTableView_;

@end
