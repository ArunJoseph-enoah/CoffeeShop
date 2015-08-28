//
//  AppDelegate.h
//  CoffeeShop
//
//  Created by Arun Joseph on 28/08/15.
//  Copyright (c) 2015 enoah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CSTableViewController.h"

@interface CSAppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController *appNavCtrl_;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CSTableViewController *csTableViewController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

