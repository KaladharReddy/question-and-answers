//
//  DetailViewController.h
//  QuestionAndAnswer
//
//  Created by kaladhar on 07/20/14.
//  Copyright (c) 2014 Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"
#import "Answer.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblQuestion;
@property (weak, nonatomic) IBOutlet UITextField *txtAnswer;



@property(nonatomic,weak) IBOutlet UITableView *detailTable;

@property(nonatomic,weak) Question *question;
@property(nonatomic,weak) Answer *answer;

@property(nonatomic,weak) NSMutableArray *questionArray;
@property(nonatomic,weak) NSString *quesAnswer;

@property(nonatomic,weak) NSMutableArray *answerArray;


@end
