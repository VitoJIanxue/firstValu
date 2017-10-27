//
//  Tool.h
//  CoreDa
//
//  Created by Vito on 17/2/27.
//  Copyright © 2017年 metarnet. All rights reserved.
//
#import <CoreData/CoreData.h>

#import <Foundation/Foundation.h>

@interface Tool : NSObject

@property ( strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property ( strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
- (void)insertCoreDatawith:(NSString *)name ands:(double)price;
- (void)dataFetchRequest;
- (void)removePerson;

@end
