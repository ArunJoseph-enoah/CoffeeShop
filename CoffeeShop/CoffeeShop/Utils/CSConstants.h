//
//  CSConstants.h
//  CoffeeShop
//
//  Created by Arun Joseph on 28/08/15.
//  Copyright (c) 2015 enoah. All rights reserved.
//

#import <Foundation/Foundation.h>

#define APP_NAME @"Coffee Shop"

/*Error messages*/

#define CONNECTIVITY_FAIL @"Unable to connect to internet. Please try again later"
#define WEB_SERVICE_API @"https://api.foursquare.com/v2/venues/explore?client_id=ACAO2JPKM1MXHQJCK45IIFKRFR2ZVL0QASMCBCG5NPJQWF2G&client_secret=YZCKUYJ1WHUV2QICBXUBEILZI1DMPUIDP5SHV043O04FKBHL&v=20130815&"

#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@interface CSConstants : NSObject

@end
