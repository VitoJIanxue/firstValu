//
//  News+CoreDataProperties.m
//  CoreDa
//
//  Created by Vito on 17/2/27.
//  Copyright © 2017年 metarnet. All rights reserved.
//

#import "News+CoreDataProperties.h"

@implementation News (CoreDataProperties)

+ (NSFetchRequest<News *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"News"];
}

@dynamic name;
@dynamic price;
@dynamic sex;

@end
