//
//  Note.m
//  Notes
//
//  Created by Сергей Буторин on 08/09/2017.
//  Copyright © 2017 Sergey Butorin. All rights reserved.
//

#import "Note.h"

@implementation Note

-(instancetype)initNoteWithTitle:(NSString *)title withText:(NSString *)text {
    
    if ((self = [super init])) {
        _title = title;
        _text = text;
        _image = [UIImage imageNamed:@"defaultPhoto"];
    }
    
    return self;
}

@end
