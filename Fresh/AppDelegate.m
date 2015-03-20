//
//  AppDelegate.m
//  Fresh
//
//  Created by Ning Wang on 15-2-20.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import "AppDelegate.h"
#import <RestKit/RestKit.h>
#import "Food2.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    // ...
    
    
    // Override point for customization after application launch.
    NSURL *baseURL = [NSURL URLWithString:@"http://52.11.84.131:8080"];
    AFHTTPClient* client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    //we want to work with JSON-Data
    [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    
    // Initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    objectManager.requestSerializationMIMEType = RKMIMETypeJSON;
    NSURL *modelURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Fresh" ofType:@"momd"]];
    
    //Iniitalize CoreData with RestKit
    NSManagedObjectModel *managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] mutableCopy];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    NSError *error = nil;
    
    NSString *path = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"Fresh.sqlite"];
    //NSLog(@"!!!!!!  %@", path);
    
    objectManager.managedObjectStore = managedObjectStore;
    [objectManager.managedObjectStore addSQLitePersistentStoreAtPath:path fromSeedDatabaseAtPath:nil withConfiguration:nil options:nil error:&error];
    [objectManager.managedObjectStore createManagedObjectContexts];
    NSLog(@"done creating contexts.");
    
    RKEntityMapping *foodMapping = [RKEntityMapping mappingForEntityForName:@"Food2" inManagedObjectStore:managedObjectStore];
    [foodMapping addAttributeMappingsFromDictionary:@{
                                                      @"_id" : @"food_id",
                                                      @"foodname" : @"foodname",
                                                      @"add_time" : @"add_time",
                                                      @"expire_period" : @"expire_period",
                                                      @"store_place" : @"store_place",
                                                      @"image_id":@"image_id",
                                                      // server side: _id; ios side: object_id
                                                      }];
    
    
    // Register our mappings with the provider
    RKResponseDescriptor *responseDescriptor_food = [RKResponseDescriptor responseDescriptorWithMapping:foodMapping
                                                                                                 method:RKRequestMethodGET
                                                                                            pathPattern:@"/api/food"
                                                                                                keyPath:nil
                                                                                            statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [objectManager addResponseDescriptor:responseDescriptor_food];
    
    RKResponseDescriptor *responseDescriptor_store_place = [RKResponseDescriptor responseDescriptorWithMapping:foodMapping
                                                                                                        method:RKRequestMethodGET
                                                                                                   pathPattern:@"/api/food/store_place/:store_place"
                                                                                                       keyPath:nil
                                                                                                   statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [objectManager addResponseDescriptor:responseDescriptor_store_place];
    
    // request descriptor
    
    RKRequestDescriptor *requestDescriptor_food = [RKRequestDescriptor requestDescriptorWithMapping:[foodMapping inverseMapping] objectClass:[Food2 class] rootKeyPath:nil method:RKRequestMethodPOST];
    [objectManager addRequestDescriptor:requestDescriptor_food];
    
    RKRequestDescriptor *requestDescriptor_food_del = [RKRequestDescriptor requestDescriptorWithMapping:[foodMapping inverseMapping] objectClass:[Food2 class] rootKeyPath:nil method:RKRequestMethodDELETE];
    [objectManager addRequestDescriptor:requestDescriptor_food_del];
    
    //
    //    RKRequestDescriptor *requestDescriptor_store_place = [RKRequestDescriptor requestDescriptorWithMapping:[foodMapping inverseMapping] objectClass:[Food class] rootKeyPath:nil method:RKRequestMethodGET];
    //    [objectManager addRequestDescriptor:requestDescriptor_store_place];
    
    NSLog(@"done creating descriptors.");
    
    
    return YES;

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
