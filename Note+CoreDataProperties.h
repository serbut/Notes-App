//
//  Note+CoreDataProperties.h
//  Notes
//
//  Created by Сергей Буторин on 14/09/2017.
//  Copyright © 2017 Sergey Butorin. All rights reserved.
//

#import "Note+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Note (CoreDataProperties)

+ (NSFetchRequest<Note *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, retain) NSData *image;

@end

NS_ASSUME_NONNULL_END
