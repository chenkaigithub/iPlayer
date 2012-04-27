//
//  AFTableViewController.m
//  iPlayer
//
//  Created by Adam Fraser on 18/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFTableViewController.h"
#import "AFLargeCell.h"
#import "AFSmallCell.h"
#import "AFAppDelegate.h"

@interface AFTableViewController ()

@end

@implementation AFTableViewController
@synthesize settingsView;
@synthesize data;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"iPlayer"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    NSMutableArray *buttons = [[NSMutableArray alloc] initWithCapacity:1];
    
    // Setup font and icon for settings button.
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithTitle:@"\u2699" style:UIBarButtonItemStylePlain target:self action:@selector(showSettings)];    
    [buttons addObject:settingsButton];
    UIFont *largeFont = [UIFont fontWithName:@"Helvetica" size:28.0];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:largeFont, UITextAttributeFont, nil];
    [settingsButton setTitleTextAttributes:dict forState:UIControlStateNormal];

    AFAppDelegate *appDelegate = (AFAppDelegate *)[[UIApplication sharedApplication] delegate];
    AFCategory *news = [appDelegate.categoryList objectForKey:@"smhNews"];
    data = news.stories;
    
    self.navigationItem.rightBarButtonItems = buttons;
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

-(void)showSettings {
    if (settingsView == nil) {
        settingsView = [[AFSettingsViewController alloc] initWithNibName:@"AFSettingsView" bundle:nil];
    }
    [self.navigationController pushViewController:settingsView animated:YES];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
      
    static NSString *LargeCellIdentifier = @"largeCell";
    AFLargeCell *largeCell = [tableView dequeueReusableCellWithIdentifier:LargeCellIdentifier];
    
    static NSString *SmallCellIdentifier = @"smallCell";
    AFSmallCell *smallCell = [tableView dequeueReusableCellWithIdentifier:SmallCellIdentifier];
    
    switch (indexPath.row) {
        case 0:

            if (largeCell == nil) {
                NSArray *cellNibs = [[NSBundle mainBundle] loadNibNamed:@"AFLargeCell" owner:nil options:nil]; 
                largeCell = [cellNibs objectAtIndex:0];
                    
                NSData *image = [[NSData alloc] initWithContentsOfURL:[[data objectAtIndex:indexPath.row] imageURL]];
                largeCell.cellImage.image = [UIImage imageWithData:image];
                largeCell.cellLabel.text = [[data objectAtIndex:indexPath.row] title];
                largeCell.selectionStyle = UITableViewCellSelectionStyleNone;
                return largeCell;
            }
            break;
            
        default:
            if (smallCell == nil) {
                int storyNumber = [indexPath row] *2;
                NSArray *cellNibs = [[NSBundle mainBundle] loadNibNamed:@"AFSmallCell" owner:nil options:nil]; 
                
                smallCell = [cellNibs objectAtIndex:0];
//                NSData *smallImageData = [[NSData alloc] initWithContentsOfURL:[[data objectAtIndex:storyNumber-1] imageURL]];
                //                smallCell.cellLeftImage.image = [UIImage imageWithData:smallImageData];
                
                [smallCell.cellLeftImage loadImageFromURL:[[data objectAtIndex:storyNumber-1] imageURL]];
                
                smallCell.cellLeftLabel.text = [[data objectAtIndex:storyNumber-1] title];
                
//                smallImageData = [[NSData alloc] initWithContentsOfURL:[[data objectAtIndex:storyNumber] imageURL]];
//                smallCell.cellRightImage.image = [UIImage imageWithData:smallImageData];
                
                [smallCell.cellRightImage loadImageFromURL:[[data objectAtIndex:storyNumber] imageURL]];
                
                smallCell.cellRightLabel.text = [[data objectAtIndex:storyNumber] title];
                smallCell.leftStory = storyNumber-1;
                smallCell.rightStory = storyNumber;
                smallCell.selectionStyle = UITableViewCellSelectionStyleNone;
                return smallCell;
            }
            break;
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AFScrollViewController *scrollView = [[AFScrollViewController alloc] initWithNibName:@"AFScrollView" bundle:nil];
    scrollView.pageNumber = indexPath.row;

    [self.navigationController pushViewController:scrollView animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 176;
    } else {
        return 122;
    }
}

- (IBAction)leftButtonpressed:(id)sender {
}
@end
