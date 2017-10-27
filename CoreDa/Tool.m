//
//  Tool.m
//  CoreDa
//
//  Created by Vito on 17/2/27.
//  Copyright © 2017年 metarnet. All rights reserved.
//

#import "newses.h"
#import "News+CoreDataClass.h"
#import "Tool.h"

@implementation Tool

- (void)removePerson
{
    // 1. 实例化查询请求
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"News"];
    
    // 2. 设置谓词条件
    request.predicate = [NSPredicate predicateWithFormat:@"name = 'xiao2'"];
    
    // 3. 由上下文查询数据
    NSArray *result = [self.managedObjectContext executeFetchRequest:request error:nil];
    
    // 4. 输出结果
    for (News *person in result) {
        NSLog(@"%@", person.name);
        
        // 删除一条记录
        [self.managedObjectContext deleteObject:person];
        break;
    }
    
    // 5. 通知_context保存数据
    if ([self.managedObjectContext save:nil]) {
        NSLog(@"删除成功");
    } else {
        NSLog(@"删除失败");
    }
}

- (void)dataFetchRequest
{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"News" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (News *info in fetchedObjects) {
        
        NSLog(@"name:%@", info.name);
      
    }
}


- (void)insertCoreDatawith:(NSString *)name ands:(double)price
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    News *contactInfo = [NSEntityDescription insertNewObjectForEntityForName:@"News" inManagedObjectContext:context];
    contactInfo.name = name;
    contactInfo.price = price;
    
    NSError *error;
    if(![context save:&error])
    {
        NSLog(@"不能保存：%@",[error localizedDescription]);
    }
}

- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"TestApp.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return _persistentStoreCoordinator;
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
