//
//  detailCell.h
//  QuestionAndAnswer
//
//  Created by kaladhar on 07/20/14.
//  Copyright (c) 2014 Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailCell : UITableViewCell

@property(weak,nonatomic) IBOutlet UILabel *questionLabel;
@property(weak,nonatomic) IBOutlet UITextField *txtAnswer;


@end
