//
//  CSData.h
//  CoffeeShop
//
//  Created by Arun Joseph on 28/08/15.
//  Copyright (c) 2015 enoah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSData : NSObject
{
    NSString *venueName_;
    NSString *venueAddress_;
    NSString *venueCity_;
    NSString *venueCountry_;
    NSString *venueDistance_;
    NSString *venueLat_;
    NSString *venueLong_;
}

@property (nonatomic, retain) NSString *venueName_;
@property (nonatomic, retain) NSString *venueAddress_;
@property (nonatomic, retain) NSString *venueCity_;
@property (nonatomic, retain) NSString *venueCountry_;
@property (nonatomic, retain) NSString *venueDistance_;
@property (nonatomic, retain) NSString *venueLat_;
@property (nonatomic, retain) NSString *venueLong_;

@end
