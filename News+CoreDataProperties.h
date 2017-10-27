//
//  News+CoreDataProperties.h
//  CoreDa
//
//  Created by Vito on 17/2/27.
//  Copyright © 2017年 metarnet. All rights reserved.
//

#import "News+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface News (CoreDataProperties)

+ (NSFetchRequest<News *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) double price;
@property (nullable, nonatomic, copy) NSString *sex;

@end

NS_ASSUME_NONNULL_END
