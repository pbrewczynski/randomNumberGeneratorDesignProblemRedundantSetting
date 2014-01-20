//
//  ViewController.m
//  RedundantSetting
//
//  Created by Paweł Brewczyński on 1/19/14.
//  Copyright (c) 2014 Paweł Brewczyński. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "TestClassFoolCompiler.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *randomNumberLabel;
@property (strong, nonatomic) Model *model;
@property (weak, nonatomic) IBOutlet UISlider *historySlider;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.model = [[Model alloc] init];
   
    self.historySlider.enabled = NO;// TOSEE1 I could DISABLE it at the start (when my model(array) is empty
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
- (IBAction)showNextNumber:(id)sender {
    self.randomNumberLabel.text = [NSString stringWithFormat:@"%d" , self.model.nextNumber];
    self.historySlider.enabled = YES; // TOSEE2 and enable it every time I know it is not empty (but it is uuuugly)..  It would be prefferable, to call it only once... when model is empty
    
    
    // UGLINESS! 
}


- (IBAction)reset:(id)sender {
    [self.model reset];
    self.historySlider.enabled = NO; // TOSEE3 again, make it DISABLED when my model is EMPTY
}


- (IBAction)changeToRandomNumberFromPast:(id)sender {
    float sliderValue        = ((UISlider *)sender).value; // could be between 0 and 0.9;
    NSUInteger sizeOfHistory = self.model.historyOfNumbers.count;
    
    NSUInteger index         = floor(sliderValue * sizeOfHistory);
    
    NSLog(@"sizeOfHistory: %d  index : %d", sizeOfHistory , index);
    
    
    
    self.randomNumberLabel.text = [NSString stringWithFormat:@"History: Your %d number : %@", index, [self.model.historyOfNumbers[index] stringValue] ]; // makes sense only if array is not empty! That is my problem!  Go to the TOSEE3 to see ugly part of code... which is executed every time you click the "Random Number" button
    
}

@end
