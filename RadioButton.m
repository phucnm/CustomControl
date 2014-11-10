//
//  RadioButton.m
//  CustomControl
//
//  Created by Phuc Nguyen on 11/9/14.
//  Copyright (c) 2014 PHUCNGUYEN. All rights reserved.
//

#import "RadioControl.h"

@implementation RadioControl

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame andOptions:(NSArray *)options {
    self.radioButtons = [NSMutableArray array];
    
    if ([super initWithFrame:frame]) {
        //int framex = frame.size.width;
        
        for (int i = 0; i < [options count]; i++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 40*i, frame.size.width, 30)];
            
            [button addTarget:self action:@selector(radioButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            UIImage *image = [[UIImage alloc] init];
            
            if (i)
                image = [UIImage imageNamed:@"radio_uncheck"];
            else
                image = [UIImage imageNamed:@"radio_check"];
            
            image = [RadioControl imageWithImage:image scaledToSize:CGSizeMake(30, 30)];
            
            [button setImage:image forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [button setTitle:[options objectAtIndex:i] forState:UIControlStateNormal];
            
            button.titleLabel.font = [UIFont systemFontOfSize:14.f];
            
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            
            button.tag = i;
            
            [self.radioButtons addObject:button];
            
            [self setBackgroundColor:[UIColor cyanColor]];
            
            [self addSubview:button];
            
        }
    }
    
    self.checkedObject = 0;
    
    return self;
}

- (void)radioButtonClicked:(UIButton *)sender {
    NSLog(@"Click at index %ld", (long)sender.tag);
    self.checkedObject = sender.tag;
    int i = sender.frame.size.height;
    for (UIButton* button in self.radioButtons) {
        UIImage *image = [RadioControl imageWithImage:[UIImage imageNamed:@"radio_uncheck"] scaledToSize:CGSizeMake(i, i)];
        
        [button setImage:image forState:UIControlStateNormal];
    }
    UIImage *image = [RadioControl imageWithImage:[UIImage imageNamed:@"radio_check"] scaledToSize:CGSizeMake(i, i)];
    
    [sender setImage:image forState:UIControlStateNormal];
    
    [self.delegate radioControlDidSelectItem:sender.tag];
}

- (int)getCheckedObject {
    return self.checkedObject;
}

@end
