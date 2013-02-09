//
//  ViewController.m
//  ArrayHack
//
//  Created by Don Bora on 2/3/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    IBOutlet UILabel *arrayLabel;
    int numberArray[10];
    int numberOfElements;
}
- (IBAction)addElement:(id)sender;
- (IBAction)removeElement:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    int i;
    
    [super viewDidLoad];

    for (i = 0; i <= 9; i++) {
        numberArray[i] = i + 1;
    }
    
    numberOfElements = i;
    [self displayArray];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
    [arrayLabel release];
    [super dealloc];
}


- (IBAction)addElement:(id)sender {
    int i;
    int indexToRemove = 4;
    
    for (i=indexToRemove; i<=numberOfElements; indexToRemove++) {
        i++;
        numberArray[indexToRemove] = i;
        
    }
    numberOfElements=10;
    [self displayArray];
}

//declare an index variable i
//hardcode a value into a new variable indexToRemove
//for loop where the index is equal to the indexToRemove and run through the code
//In the loop, overwrite the array starting at indexToRemove and equal it to the next number in the array...increment the index variable i
//adjust the array of [i-1] = 0
//adjust numberOfElements = i-1 which changes the array length
- (IBAction)removeElement:(id)sender {
    int i;
    int indexToRemove = 4;
    for (i=indexToRemove; i<numberOfElements; indexToRemove++) {
        i++;
        numberArray[indexToRemove] = i+1;
        NSLog(@"%i",numberOfElements);
    }
    numberOfElements=9;
    [self displayArray];
}


-(void)displayArray
{
    NSString* displayString = nil;
    
    for (int i = 0; i < numberOfElements; i++) {
        
        if (displayString == nil) {
            displayString = [NSString stringWithFormat:@"%i", numberArray[i]];
        }
        else{
            displayString = [NSString stringWithFormat:@"%@, %i", displayString, numberArray[i]];
        }
    }
    
    arrayLabel.text = displayString;
}
@end
