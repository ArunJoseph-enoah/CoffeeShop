//
//  CSCommon.m
//  CoffeeShop
//
//  Created by Arun Joseph on 28/08/15.
//  Copyright (c) 2015 enoah. All rights reserved.
//

#import "CSCommon.h"
#import "CSConstants.h"

@implementation CSCommon

///////////////////////////////////////////////////////////////////////////////////////
//Purpose     : show Alert With Message
//Parameters  : message
//Return type : void
///////////////////////////////////////////////////////////////////////////////////////
+ (void)showAlertWithMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:APP_NAME message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
}

@end
