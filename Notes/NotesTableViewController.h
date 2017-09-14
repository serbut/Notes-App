//
//  NotesTableViewController.h
//  Notes
//
//  Created by Сергей Буторин on 08/09/2017.
//  Copyright © 2017 Sergey Butorin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note+CoreDataProperties.h"
#import "AppDelegate.h"

@interface NotesTableViewController : UITableViewController

@property NSMutableArray *notes;
@property AppDelegate *appDelegate;
@property NSManagedObjectContext *managedObjectContext;

-(void) loadNotes;
-(void) addNote: (Note*) note;

@end
