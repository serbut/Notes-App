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
    [self createInitialNotes];
    [self.tableView reloadData];
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

-(void) createInitialNotes {
    for (int i = 0; i < 10; i++) {
        Note *newNote = [[Note alloc] initNoteWithTitle: [NSString stringWithFormat: @"Note %d", i + 1] withText:@"The UITableViewCell class defines the attributes and behavior of the cells that appear in UITableView objects. This class includes properties and methods for setting and managing cell content and background (including text, images, and custom views), managing the cell selection and highlight state, managing accessory views, and initiating the editing of the cell contents"];
        [_notes addObject:(newNote)];
        
    }
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

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqual: @"EditNote"]) {
        
        NoteTableViewCell *cell = (NoteTableViewCell *)sender;

        EditNoteViewController *editNoteVC = [segue destinationViewController];
        
        editNoteVC.titleTextField.text = cell.titleLabel.text;
        editNoteVC.textView.text = cell.textLabel.text;
        
        editNoteVC.title = cell.titleLabel.text;
    } else if ([segue.identifier isEqual: @"NewNote"]) {
        EditNoteViewController *editNoteVC = [segue destinationViewController];
        
        editNoteVC.title = @"New note";
    }
}

@end
