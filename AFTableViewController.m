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


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"iPlayer"];
    self.view.backgroundColor = [UIColor clearColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AFAppDelegate *appDelegate = (AFAppDelegate *)[[UIApplication sharedApplication] delegate];
    AFCategory *news = [appDelegate.categoryList objectForKey:@"smhNews"];

    
    static NSString *LargeCellIdentifier = @"largeCell";
    AFLargeCell *largeCell = [tableView dequeueReusableCellWithIdentifier:LargeCellIdentifier];
    
    static NSString *SmallCellIdentifier = @"smallCell";
    AFSmallCell *smallCell = [tableView dequeueReusableCellWithIdentifier:SmallCellIdentifier];
    
    switch (indexPath.row) {
        case 0:
            if (largeCell == nil) {
                NSArray *cellNibs = [[NSBundle mainBundle] loadNibNamed:@"AFLargeCell" owner:nil options:nil]; 
                for (id object in cellNibs) {
                    if ([object isKindOfClass:[UITableViewCell class]]) {
                        largeCell = (AFLargeCell *) object;
                    }
                }
                NSData *image = [[NSData alloc] initWithContentsOfURL:[[[news stories] objectAtIndex:indexPath.row] imageURL]];
                largeCell.cellImage.image = [UIImage imageWithData:image];
                largeCell.cellLabel.text = [[[news stories] objectAtIndex:indexPath.row] title];
                            return largeCell;
            }
            break;
            
        default:
            if (smallCell == nil) {
                NSArray *cellNibs = [[NSBundle mainBundle] loadNibNamed:@"AFSmallCell" owner:nil options:nil]; 
                for (id object in cellNibs) {
                    if ([object isKindOfClass:[UITableViewCell class]]) {
                        smallCell = (AFSmallCell *) object;
                    }
                }
                [[[news stories] objectAtIndex:indexPath.row] imageURL];
                NSData *smallImageData = [[NSData alloc] initWithContentsOfURL:[[[news stories] objectAtIndex:indexPath.row] imageURL]];
                smallCell.cellLeftImage.image = [UIImage imageWithData:smallImageData];
                smallCell.cellLeftLabel.text = [[[news stories] objectAtIndex:indexPath.row] title];
                
                smallImageData = [[NSData alloc] initWithContentsOfURL:[[[news stories] objectAtIndex:indexPath.row+1] imageURL]];
                smallCell.cellRightImage.image = [UIImage imageWithData:smallImageData];
                smallCell.cellRightLabel.text = [[[news stories] objectAtIndex:indexPath.row] title];
                return smallCell;
            }
            break;
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 176;
    } else {
        return 125;
    }
}

@end
