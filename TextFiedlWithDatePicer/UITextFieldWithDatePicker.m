//
//  UITextFieldWithDatePicker.m
//  TextFiedlWithDatePicer
//
//  Created by Darren Huang on 2016/7/31.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import "UITextFieldWithDatePicker.h"

@interface UITextFieldWithDatePicker()
@property (strong,nonatomic) UIDatePicker *datePicker;
@end

@implementation UITextFieldWithDatePicker

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setDatePicker];
    
}

- (void)setDatePicker{
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
    self.inputView = self.datePicker;
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed)];
    
    toolBar.items = [NSArray arrayWithObjects: flexible, right, nil];
    
    self.inputAccessoryView = toolBar;
}

- (void)doneButtonPressed{
    if([self endEditing:NO]){
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"YYYY-MM-dd"];
        self.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:self.datePicker.date]];
    }
}



@end
