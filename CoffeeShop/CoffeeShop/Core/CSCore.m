//
//  CSCore.m
//  CoffeeShop
//
//  Created by Admin on 28/08/15.
//  Copyright (c) 2015 enoah. All rights reserved.
//

#import "CSCore.h"
#import "CSTableViewController.h"
#import "CSConstants.h"
#import "CSData.h"
#import "CSTableViewController.h"


@implementation CSCore

@synthesize locDataArr_;

-(void)getLocationForLatitude: (NSString *)latitude
                                Longitude:(NSString *)longitude
{
    NSString *searchString = @"coffee%20shop";
    
    NSString *urlString = [NSString stringWithFormat:@"%@ll=%@,%@&radius=2000&query=%@", WEB_SERVICE_API, latitude, longitude, searchString];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    //NSURL *url = [NSURL URLWithString:@"https://api.foursquare.com/v2/venues/explore?client_id=ACAO2JPKM1MXHQJCK45IIFKRFR2ZVL0QASMCBCG5NPJQWF2G&client_secret=YZCKUYJ1WHUV2QICBXUBEILZI1DMPUIDP5SHV043O04FKBHL&v=20130815&ll=13.0,80.2&radius=3000&query=coffee%20shop"];
    
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
