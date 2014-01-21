//
//  AppDelegate.m
//  InstaPhoto
//
//  Created by Daniela Baron on 1/19/2014.
//  Copyright (c) 2014 DaniB. All rights reserved.
//

#import "AppDelegate.h"

#import "Photo.h"
#import "FeedTableViewController.h"
#import "FavoritesViewController.h"
#import "ProfileViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Instantiate a Photo model
    Photo *aPhoto = [[Photo alloc] init];
    aPhoto.title = @"Title 1";
    aPhoto.detail = @"Detail 1";
    aPhoto.filename = @"filename1.png";
    aPhoto.thumbnail = @"thumbnail1.png";
    
    // Wrap profile view controller in a nav controller
    ProfileViewController *profileViewController = [[ProfileViewController alloc] init];
    UINavigationController *profileNavController = [[UINavigationController alloc] initWithRootViewController:profileViewController];
    
    // Wrap feed table view controller in a nav controller
    FeedTableViewController *feedTableViewController = [[FeedTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *feedTableNavController = [[UINavigationController alloc] initWithRootViewController:feedTableViewController];
    
    // Wrap favorites view controller in a nav controller
    FavoritesViewController *favoritesViewController = [[FavoritesViewController alloc] init];
    UINavigationController *favoritesNavController = [[UINavigationController alloc] initWithRootViewController:favoritesViewController];
    
    // Wrap all nav controllers in the tab controller
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:@[feedTableNavController, favoritesNavController, profileNavController]];
    
    self.window = [[UIWindow alloc] initWithFrame:[ [UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
