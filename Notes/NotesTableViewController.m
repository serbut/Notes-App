//
//  NotesTableViewController.m
//  Notes
//
//  Created by Сергей Буторин on 08/09/2017.
//  Copyright © 2017 Sergey Butorin. All rights reserved.
//

#import "NotesTableViewController.h"
#import "NoteTableViewCell.h"
#import "EditNoteViewController.h"

@interface NotesTableViewController ()


@end

@implementation NotesTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _notes = [[NSMutableArray alloc] initWithCapacity:1];
    
    [self loadNotes];
}

- (void) loadNotes {
    _appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    _managedObjectContext = _appDelegate.persistentContainer.viewContext;
    
    NSFetchRequest<NSManagedObject*> *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Note"];
    NSError *error ;
    NSArray *resultArray= [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    [_notes addObjectsFromArray:resultArray];
}

- (void) addNote:(Note *)note {
    NSManagedObject *entityNameObj = [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:_managedObjectContext];
    [entityNameObj setValue:note.title forKey:@"title"];
    [entityNameObj setValue:note.text forKey:@"text"];
    [_appDelegate saveContext];
    NSLog(@"Note with title %@ saved", note.title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _notes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.titleLabel.text = [_notes[indexPath.row] title];
    cell.textLabel.text = [_notes[indexPath.row] text];

    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqual: @"EditNote"]) {
        
        NoteTableViewCell *cell = (NoteTableViewCell *)sender;
        EditNoteViewController *editNoteVC = [segue destinationViewController];
        
        editNoteVC.note = _notes[[self.tableView indexPathForCell:sender].row];
        
        editNoteVC.title = cell.titleLabel.text;
    } else if ([segue.identifier isEqual: @"NewNote"]) {
        EditNoteViewController *editNoteVC = [segue destinationViewController];
        
        editNoteVC.title = @"New note";
    }
}

- (IBAction)unwindFromEditNote:(UIStoryboardSegue*)sender
{
    EditNoteViewController *sourceViewController = sender.sourceViewController;

    NSString *title = sourceViewController.titleTextField.text;
    NSString *text = sourceViewController.textView.text;
    
    if (title != nil && text != nil) {
        Note *note = sourceViewController.note;
        if (note != nil) {
            note.title = title;
            note.text = text;
        } else {
            note =  [[Note alloc] init];
            [_notes addObject: note];
            [self addNote: note];
        }
    }
    [self.tableView reloadData];
}

@end
