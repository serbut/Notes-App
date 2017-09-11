//
//  NoteTableViewCell.m
//  Notes
//
//  Created by Сергей Буторин on 08/09/2017.
//  Copyright © 2017 Sergey Butorin. All rights reserved.
//

#import "NoteTableViewCell.h"

@implementation NoteTableViewCell

@synthesize textLabel, imageView;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
