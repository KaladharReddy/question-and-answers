//
//  ViewController.m
//  QuestionAndAnswer
//
//  Created by kaladhar on 07/20/14.
//  Copyright (c) 2014 Macbook Pro. All rights reserved.
//





#import "ViewController.h"
#import "questionCell.h"
#import "AppDelegate.h"
#import "Question.h"
#import "Answer.h"
#import "DetailViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    self.title = @"Questions";
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSLog(@"numberOfRowsInSection: %i", [self.questionArray count]);
    
    return [self.questionArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    questionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"questionCell" forIndexPath:indexPath];
    
    Question *thisQuestion = [self.questionArray objectAtIndex:indexPath.row];
    
    cell.questionLabel.text = thisQuestion.questContent;
    
    return cell;
    
    NSLog(@"Populating TableView Cell: cellForRowAtIndexPath");
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Question *thisQuestion = [self.questionArray objectAtIndex:indexPath.row];
    
    
    DetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    detailViewController.question = thisQuestion;
    
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
   NSLog(@"Navigation Controller pushed to DetailViewController");
    
}

@end
