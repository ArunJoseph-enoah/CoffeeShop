//
//  CSMapViewController.m
//  CoffeeShop
//
//  Created by Arun Joseph on 28/08/15.
//  Copyright (c) 2015 enoah. All rights reserved.
//

#import "CSMapViewController.h"
#import "CSData.h"


@interface CSMapViewController ()

@end

@implementation CSMapViewController

@synthesize data_;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [self showAnnotation:data_];
}

-(void)showAnnotation: (CSData *)data
{
    MKMapRect zoomRect = MKMapRectNull;
    MKPointAnnotation *ann = [self createAnnotations:data];
    
    MKMapPoint annotationPoint = MKMapPointForCoordinate(ann.coordinate);
    MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.1, 0.1);
    zoomRect = MKMapRectUnion(zoomRect, pointRect);
 
    [csMapView_ setVisibleMapRect:zoomRect animated:YES];
    
    self.title = data.venueName_;
}

-(MKPointAnnotation *)createAnnotations :(CSData *)data
{
    CGPoint pointOne = CGPointMake([data.venueLat_ doubleValue], [data.venueLong_ doubleValue]);
    
    CLLocationCoordinate2D pinPoint = CLLocationCoordinate2DMake(pointOne.x, pointOne.y);
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    
    annotation.coordinate = pinPoint;
    annotation.title = data.venueName_;
    annotation.subtitle = data.venueAddress_;
    
    return annotation;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
