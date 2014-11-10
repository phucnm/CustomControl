//
//  CheckBoxControl.m
//  CustomControl
//
//  Created by Phuc Nguyen on 11/9/14.
//  Copyright (c) 2014 PHUCNGUYEN. All rights reserved.
//

#import "CheckBoxControl.h"

@implementation CheckBoxControl

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
    self.checkBoxButtons = [NSMutableArray array];
    
    if ([super initWithFrame:frame]) {
        //int framex = frame.size.width;
        
        for (int i = 0; i < [options count]; i++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 40*i, frame.size.width - 20, 30)];
            
            [button addTarget:self action:@selector(checkBoxClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            UIImage *image = [UIImage imageNamed:@"checkbox_uncheck"];
            
            image = [CheckBoxControl imageWithImage:image scaledToSize:CGSizeMake(30, 30)];
            
            [button setImage:image forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [button setTitle:[options objectAtIndex:i] forState:UIControlStateNormal];
            
            button.titleLabel.font = [UIFont systemFontOfSize:14.f];
            
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            
            button.tag = i;
            
            [self.checkBoxButtons addObject:button];
            
            [self addSubview:button];
            
            [self setBackgroundColor:[UIColor grayColor]];
            
        }
    }

    self.checkedObjects = [NSMutableArray array];
    
    for (int i = 0; i < [options count]; i++) {
        [self.checkedObjects addObject:[NSNumber numberWithInt:0]];
    }
    
    return self;
}

- (void)checkBoxClicked:(UIButton *)sender {
    NSLog(@"Click at index %ld", (long)sender.tag);
    if ([self.checkedObjects[sender.tag] integerValue] == 1) {
        self.checkedObjects[sender.tag] = [NSNumber numberWithInt:0];
    } else {
        self.checkedObjects[sender.tag] = [NSNumber numberWithInt:1];
    }
    
    int h = sender.frame.size.height;

    if ([self.checkedObjects objectAtIndex:sender.tag] == [NSNumber numberWithInt:0]) {
        [sender setImage:[CheckBoxControl imageWithImage:[UIImage imageNamed:@"checkbox_uncheck"] scaledToSize:CGSizeMake(h, h)] forState:UIControlStateNormal];
    }
    else {
        [sender setImage:[CheckBoxControl imageWithImage:[UIImage imageNamed:@"checkbox_check"] scaledToSize:CGSizeMake(h, h)] forState:UIControlStateNormal];
    }
    
    [self.delegate checkBoxControlDidSelectItem:sender.tag];
    
}

- (NSArray*)getCheckedObjects {
    return self.checkedObjects;
}

@end
