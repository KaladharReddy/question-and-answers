//
//  AppDelegate.m
//  QuestionAndAnswer
//
//  Created by kaladhar on 07/20/14.
//  Copyright (c) 2014 Macbook Pro. All rights reserved.
//





#import "AppDelegate.h"
#import "Question.h"
#import "Answer.h"
#import "ViewController.h"

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity =  [NSEntityDescription entityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
   
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        
    }
    
   if ([fetchedObjects count] > 0) {
        
        NSLog(@"fetchedObjects in appDelegate: %i", [fetchedObjects count]);
        
        
        UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
       ViewController *viewController = [navController.viewControllers objectAtIndex:0];
        
       viewController.questionArray = [NSMutableArray arrayWithArray:fetchedObjects];
        
       [viewController.questionTable reloadData];
        
       NSLog(@"fetchedObjects ViewController.questionArray: %i", [viewController.questionArray count]);
        
        }
  else{ 
      
     
       [self prepopulateQuestionAndAnswers];
      
   }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
   
    
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}
#pragma mark - Core Data stack
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"QAModel" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"QAModel.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


#pragma mark - Application's Documents directory

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void)prepopulateQuestionAndAnswers{
        
    
   Question *q1 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q1.questContent = @"What is the place value of digit 5 in 356 327 009 122 000?";
    
    Question *q2 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q2.questContent = @"How do you write “four hundred trillion, five hundred eight million, five thounsand, ten in” in numeral?";

    Question *q3 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q3.questContent = @"What is the common use good conductor of electricity";
    
    Question *q4 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q4.questContent = @"What do you call an energy at” Rest?";
   
    Question *q5 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q5.questContent = @"What compound that gives color green property of the plant leaves";
    
    Question *q6 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q6.questContent = @"Who is the person that made the first footstep on the moon?";

    Question *q7 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q7.questContent = @"What is the center of the Solar System?";

    Question *q8 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q8.questContent = @"What is the largest organ of human body?";
    
    Question *q9 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q9.questContent = @"Who is the inventor of Telephone?";

    Question *q10 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q10.questContent = @"What is other term for computer motherboard?";
    
    Question *q11 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q11.questContent = @"What is the National capital of the Philippines?";
    
    Question *q12 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q12.questContent = @"When was the declaration of martial law in the Philippines?";
    
    Question *q13 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q13.questContent = @"What is the pumping organ of the human body?";

    Question *q14 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q14.questContent = @"Today, does pluto is still consider as a planet?";
    
    Question *q15 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q15.questContent = @"If Sun is to Star and Earth is to Planet and Moon is to ____?";

    Question *q16 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q16.questContent = @"What is 2/3 0f 3/4?";

    Question *q17 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q17.questContent = @"What is the National language of Japan?";

    Question *q18 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q18.questContent = @"What is the oldest form of trading?";

    Question *q19 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q19.questContent = @"What is the Current relation to Resistance?";
    
    Question *q20 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.managedObjectContext];
    q20.questContent = @"What is the largest continent in the world?";
    
    
  
   Answer *a1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a1.ansContent = @"Ten Trillion ";
    q1.answer = a1;
    
    Answer *a2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a2.ansContent = @"400,508,005, 010";
    q2.answer = a2;
    
    Answer *a3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a3.ansContent = @"Copper";
    q3.answer = a3;
    
    Answer *a4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a4.ansContent = @"Potential energy";
    q4.answer = a4;
    
    Answer *a5 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a5.ansContent = @"chlorophyll";
    q5.answer = a5;
    
    Answer *a6 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a6.ansContent = @"Neil Amstrong";
    q6.answer = a6;
    
    Answer *a7 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a7.ansContent = @"Sun";
    q7.answer = a7;
    
    Answer *a8 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a8.ansContent = @"Skin";
    q8.answer = a8;
    
    Answer *a9 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a9.ansContent = @"Alexander Graham Bell";
    q9.answer = a9;
    
    Answer *a10 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a10.ansContent = @"Mainboard ";
    q10.answer = a10;
    
    Answer *a11 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a11.ansContent = @"Manila";
    q11.answer = a11;
    
    Answer *a12 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a12.ansContent = @"Sept 21, 1972";
    q12.answer = a12;
    
    Answer *a13 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a13.ansContent = @"Heart";
    q13.answer = a13;
    
    Answer *a14 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a14.ansContent = @"No";
    q14.answer = a14;
    
    Answer *a15 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a15.ansContent = @"Satellite";
    q15.answer = a15;
    
    Answer *a16 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a16.ansContent = @"1/2";
    q16.answer = a16;
    
    Answer *a17 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a17.ansContent = @"Nihongo";
    q17.answer = a17;
    
    Answer *a18 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a18.ansContent = @"Barter Trade";
    q18.answer = a18;
    
    Answer *a19 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a19.ansContent = @"Inversely proportional";
    q19.answer = a19;
    
    Answer *a20 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:self.managedObjectContext];
    a20.ansContent = @"Asia";
    q20.answer = a20;
    
    
    _dataArray = @[q1,q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19,q20];
    
     NSLog(@"Populating ViewController.questionArray: ");
    
    [self saveContext];
    
    UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
    ViewController *viewController = [navController.viewControllers objectAtIndex:0];
   
    viewController.questionArray = [NSMutableArray arrayWithArray:_dataArray];
    
   [viewController.questionTable reloadData];

    
  
    
}




@end
