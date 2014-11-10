//
//  ViewController.m
//  CustomControl
//
//  Created by Phuc Nguyen on 11/9/14.
//  Copyright (c) 2014 PHUCNGUYEN. All rights reserved.
//

#import "ViewController.h"
#import "CheckBoxControl.h"
#import "RadioControl.h"

@interface ViewController () <RadioControlDelegate, CheckBoxControlDelegate>
@property (weak, nonatomic) IBOutlet UILabel *RadioCurrentItemLabel;
@property (strong, nonatomic) RadioControl *radioButton;
@property (strong, nonatomic) CheckBoxControl *checkBoxControl;
@end

@implementation ViewController

- (void)radioControlDidSelectItem:(NSInteger)index {
    NSLog(@"Radio click at : %ld", index);
}

- (id)checkBoxControlDidSelectItem:(NSInteger)index {
    NSLog(@"Check box selected at : %ld", index);
}

- (IBAction)GetCheckedItemRadioButton:(id)sender {
    self.RadioCurrentItemLabel.text = [NSString stringWithFormat:@"%d", [self.radioButton getCheckedObject] ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *arrayOptions = @[@"One", @"Two", @"Three", @"Four", @"Five"];
    
    self.radioButton = [[RadioControl alloc] initWithFrame:CGRectMake(20, 20, 150, 240) andOptions:arrayOptions];
    
    [self.view addSubview:self.radioButton];
    
    NSArray *arrayOptionsCheckbox = @[@"One", @"Two", @"Three", @"Four", @"Five"];
    
    self.checkBoxControl = [[CheckBoxControl alloc] initWithFrame:CGRectMake(20, 240, 150, 240) andOptions:arrayOptionsCheckbox];
    
    [self.view addSubview:self.checkBoxControl];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
