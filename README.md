CustomControl
=============

Custom Control for iOS

#Overview

#Usage

## Radio Control
Init an array of Options:
    
     NSArray *arrayOptions = @[@"One", @"Two", @"Three", @"Four", @"Five"];

Init RadioButton instance:
  
      RadioButton *radioButton = [[RadioButton alloc] initWithFrame:CGRectMake(20, 20, 150, 240) andOptions:arrayOptions];
  
Add subView to your ViewController:
  
      [self.view addSubview:self.radioButton];
