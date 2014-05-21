//
//  ViewController.m
//  Deprocrastinator
//
//  Created by teacher on 5/19/14.
//  Copyright (c) 2014 Mathien. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property BOOL x;
@property (strong, nonatomic) IBOutlet UIButton *add;

@end

@implementation ViewController




- (IBAction)onEditButtonPressed:(UIButton *)sender
{
    self.editing = ! self.editing;

    if(self.editing)
    {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
    }

    else
    {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
    }
}




- (IBAction)onAddButtonPressed:(id)sender
{
    NSString *nospaces = [self.textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    if ([nospaces  isEqual: @""])
    {
        nil;
    }

    else
    {
        MagicalCreature *newCreature = [[MagicalCreature alloc]init];
        newCreature.name = self.textField.text;
        [self.creatures addObjet:newCreature];
        [self.myTableView reloadData];

        [self.textField resignFirstResponder];
        self.textField.text = nil;
        [self.myTableView reloadData];

//        [self.tasksArray addObject:self.textField.text];
//    [self.myTableView reloadData];
//    [self.textField resignFirstResponder];
//    self.textField.text = [NSString stringWithFormat: @""];
    }
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.tasksArray objectAtIndex:indexPath.row];

    return cell;
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tasksArray.count;
}






- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];

    if ([selectedCell.textLabel.textColor isEqual: [UIColor greenColor]])
    {
     selectedCell.textLabel.textColor = [UIColor blackColor];
    }

    else
    {
    selectedCell.textLabel.textColor = [UIColor greenColor];

    }

    if (self.editing)
    {
        [self.tasksArray removeObjectAtIndex:indexPath.row];
        [self.myTableView reloadData];
    }
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tasksArray = [NSMutableArray arrayWithObjects:@"Haircut", @"Drink Water", @"Play Basketball", @"Code", nil];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
