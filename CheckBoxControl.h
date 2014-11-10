//
//  CheckBoxControl.h
//  CustomControl
//
//  Created by Phuc Nguyen on 11/9/14.
//  Copyright (c) 2014 PHUCNGUYEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckBoxControl : UIView

@property (strong, nonatomic) NSMutableArray *checkBoxButtons;

- (id) initWithFrame:(CGRect)frame andOptions:(NSArray*)options;

- (IBAction)checkBoxClicked:(UIButton *)sender;

- (NSArray*) getCheckedObjects;

@property (nonatomic) NSMutableArray *checkedObjects;

@property (strong, nonatomic) id delegate;

@end

@protocol CheckBoxControlDelegate

- (id) checkBoxControlDidSelectItem:(NSInteger)index;

@end
