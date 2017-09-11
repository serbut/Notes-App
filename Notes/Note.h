//
//  Note.h
//  Notes
//
//  Created by Сергей Буторин on 08/09/2017.
//  Copyright © 2017 Sergey Butorin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Note : NSObject

@property NSString *title;
@property NSString *text;
@property UIImage *image;

-(instancetype) initNoteWithTitle: (NSString*) title
            withText: (NSString*) text;

@end
