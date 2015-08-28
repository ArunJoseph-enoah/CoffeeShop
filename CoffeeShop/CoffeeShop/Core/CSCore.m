//
//  CSCore.m
//  CoffeeShop
//
//  Created by Arun Joseph on 28/08/15.
//  Copyright (c) 2015 enoah. All rights reserved.
//

#import "CSCore.h"
#import "CSTableViewController.h"
#import "CSConstants.h"
#import "CSData.h"
#import "CSTableViewController.h"


@implementation CSCore

@synthesize locDataArr_;

///////////////////////////////////////////////////////////////////////////////////////
//Purpose     : To send request to four square API and get the list of coffee shops.
//Parameters  : Latitude and Longitude (As NSString)
//Return type : void
///////////////////////////////////////////////////////////////////////////////////////

-(void)getLocationForLatitude: (NSString *)latitude
                                Longitude:(NSString *)longitude
{
    NSString *searchString = @"coffee%20shop";
    
    NSString *urlString = [NSString stringWithFormat:@"%@ll=%@,%@&radius=2000&query=%@", WEB_SERVICE_API, latitude, longitude, searchString];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
                            {
                               if (error)
                               {
                                   NSLog(@"error:%@", error.localizedDescription);
                               }
                                [self parseResponse:data];
                           }];
}

///////////////////////////////////////////////////////////////////////////////////////
//Purpose     : This method will parse the response data and delegate the CSData Array
//Parameters  : NSData responseData
//Return type : void
///////////////////////////////////////////////////////////////////////////////////////

-(void)parseResponse: (NSData *)responseData
{
    NSError *error;
    
    NSDictionary *resDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:&error];
    
    self.locDataArr_ = [[NSMutableArray alloc] init];
    
    NSDictionary *responseDictionary = [resDictionary valueForKey:@"response"];
    NSDictionary *groupsDictionary = [responseDictionary valueForKey:@"groups"];
    NSArray *items = [groupsDictionary valueForKey:@"items"];
    NSArray *itemsArr = [items objectAtIndex:0];

    for( int i=0; i<[itemsArr count]; i++)
    {
        CSData *data = [[CSData alloc] init];
        NSDictionary *dictionary = [itemsArr objectAtIndex:i];
        NSDictionary *venueDictionary = [dictionary valueForKey:@"venue"];
        data.venueName_ = [venueDictionary valueForKey:@"name"];
        NSDictionary *locationDictionary = [venueDictionary valueForKey:@"location"];
        
        data.venueAddress_ = [locationDictionary valueForKey:@"address"];
        data.venueLat_ = [locationDictionary valueForKey:@"lat"];
        data.venueLong_ = [locationDictionary valueForKey:@"lng"];
        data.venueDistance_ = [locationDictionary valueForKey:@"distance"];
        data.venueCountry_ = [locationDictionary valueForKey:@"country"];
        
        [self.locDataArr_ addObject:data];
    }
    
    [self.delegate_ didReceivedLocation:locDataArr_];
}

@end
