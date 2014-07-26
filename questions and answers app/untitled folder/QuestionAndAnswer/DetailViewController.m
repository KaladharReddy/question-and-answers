//
//  DetailViewController.m
//  QuestionAndAnswer
//
//  Created by kaladhar on 07/20/14.
//  Copyright (c) 2014 Macbook Pro. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "Question.h"
#import "ViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *answerBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Submit Answer" style:UIBarButtonItemStyleBordered target:self action:@selector(cmdAnswer_Tapped)];
    
    self.navigationItem.rightBarButtonItem = answerBarButtonItem;
    

}

 int x=0;

- (void)cmdAnswer_Tapped{
    
    NSString *ansString =  self.quesAnswer;
    
    NSString *trimmedAnswer = [ansString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *trimmedQuestion = [self.txtAnswer.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
   
        if ([trimmedAnswer compare:trimmedQuestion options:NSCaseInsensitiveSearch] == NSOrderedSame)
        {
                        [self showCorrectAnswer];
        }
        else
        {
            
            x=x+1;
            
            if(x >= 3){
                [self showInvalidMessage];
                x = 0;
            }
            else{
                [self showWrongMessage];
            }
        }
    
}


-(void) showCorrectAnswer{
    UIAlertView *answerAlert = [[UIAlertView alloc]initWithTitle:@"CONGRATULATIONS!!! \n You got the correct answer" message:self.question.answer.ansContent delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [answerAlert show];

}

-(void) showAnswer{
    UIAlertView *answerAlert = [[UIAlertView alloc]initWithTitle:@"Correct Answer" message:self.question.answer.ansContent delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [answerAlert show];
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0)
	{
        [self.navigationController popViewControllerAnimated:YES];
	}
	else if (buttonIndex == 1)
	{
		self.txtAnswer.text = @"";
	}
    else if (buttonIndex == 2)
    {
        [self showAnswer];
    }
}


-(void) showWrongMessage{
    UIAlertView *wrongAlert = [[UIAlertView alloc]initWithTitle:@"Wrong Answer" message:@"You entered a wrong answer..." delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [wrongAlert addButtonWithTitle:@"Return"];
    [wrongAlert addButtonWithTitle:@"Retry"];
    [wrongAlert show];
}

-(void) showInvalidMessage{
    UIAlertView *wrongAlert = [[UIAlertView alloc]initWithTitle:@"Wrong Answer" message:@"You entered a wrong answer for 3 times" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [wrongAlert addButtonWithTitle:@"Return"];
    [wrongAlert addButtonWithTitle:@"Retry"];
    [wrongAlert addButtonWithTitle:@"Show Answer"];
    [wrongAlert show];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    }

- (void) viewWillAppear:(BOOL)animated
{
    self.lblQuestion.text = self.question.questContent;
    self.quesAnswer = self.question.answer.ansContent;
    
    [self.txtAnswer becomeFirstResponder];
}


- (IBAction)cmdSubmit_Tapped:(UIBarButtonItem *)sender {
}
@end
