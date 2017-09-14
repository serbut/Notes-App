//
//  Note+CoreDataProperties.m
//  Notes
//
//  Created by Сергей Буторин on 14/09/2017.
//  Copyright © 2017 Sergey Butorin. All rights reserved.
//

#import "Note+CoreDataProperties.h"

@implementation Note (CoreDataProperties)

+ (NSFetchRequest<Note *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Note"];
}

@dynamic text;
@dynamic title;
@dynamic image;

@end
