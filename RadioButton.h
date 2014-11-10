//
//  RadioButton.h
//  CustomControl
//
//  Created by Phuc Nguyen on 11/9/14.
//  Copyright (c) 2014 PHUCNGUYEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioButton : UIView

@property (strong, nonatomic) NSMutableArray *radioButtons;

- (id) initWithFrame:(CGRect)frame andOptions:(NSArray*)options;

- (IBAction)radioButtonClicked:(UIButton *)sender;

- (int) getCheckedObject;

@property (nonatomic) NSInteger checkedObject;

@end