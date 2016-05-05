//
//  ViewController.m
//  DatePickerDemo
//
//  Created by Guillermo Gruschka on 2/26/16.
//  Copyright © 2016 Guillermo Gruschka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property NSArray *moods;

@end

@implementation ViewController
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [[self moods]count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self moods][row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    UIColor *moodColor;
    switch (row) {
        case 0:
            moodColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
            break;
        case 1:
            moodColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
            break;
        case 2:
            moodColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0];
            break;
        default:
            moodColor = [UIColor whiteColor];
            break;
    }
    [[self view] setBackgroundColor:moodColor];
}

- (IBAction)displayDay:(id)sender {
    NSDate *chosenDate = [[self datePicker]date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"EEEE"];
    
    NSString *weekday = [formatter stringFromDate:chosenDate];
    NSString *msg = [[NSString alloc] initWithFormat:@"That's a %@", weekday];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"What day is that?" message:msg delegate:nil cancelButtonTitle:@"Okay." otherButtonTitles:nil, nil];
    
    [alert show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMoods:@[@"Happy",@"Sad",@"Angry",@"Love"]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
