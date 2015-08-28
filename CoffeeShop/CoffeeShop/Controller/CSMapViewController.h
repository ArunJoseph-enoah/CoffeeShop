//
//  CSMapViewController.h
//  CoffeeShop
//
//  Created by Arun Joseph on 28/08/15.
//  Copyright (c) 2015 enoah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CSData.h"

@interface CSMapViewController : UIViewController
{
    IBOutlet MKMapView *csMapView_;
    
    CSData *data_;
}

@property(nonatomic, retain)    CSData *data_;

@end
