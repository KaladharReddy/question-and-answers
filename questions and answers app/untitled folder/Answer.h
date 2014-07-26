//
//  Answer.h
//  QuestionAndAnswer
//
//  Created by kaladhar on 07/20/14.
//  Copyright (c) 2014 Macbook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question;

@interface Answer : NSManagedObject

@property (nonatomic, retain) NSString * ansContent;
@property (nonatomic, retain) Question *question;

@end
