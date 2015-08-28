//
//  CSCore.h
//  CoffeeShop
//
//  Created by Admin on 28/08/15.
//  Copyright (c) 2015 enoah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSData.h"
//#import "CSTableViewController.h"

@protocol CSDataReceivedDelegate <NSObject>

- (void)didReceivedLocation:(NSMutableArray *)locDataArr;

@end

@interface CSCore : NSObject

{
    NSMutableArray *locDataArr_;
}

-(void)getLocationForLatitude: (NSString *)latitude
                                Longitude:(NSString *)longitude;

@property (nonatomic, retain)NSMutableArray *locDataArr_;

@property (weak, nonatomic) id<CSDataReceivedDelegate> delegate_;

@end
