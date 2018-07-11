//
//  DatePickerView.h
//  iOSJiCheHui
//
//  Created by 邢广范 on 2016/12/22.
//  Copyright © 2016年 邢广范. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DateModel;

@protocol DatePickerViewDelegate <NSObject>

//- (void)clickSureButtonWithDate:(DateModel *)model;

- (void)clickCancelButton;

- (void)clickBackViewTap;

@end


@interface DatePickerView : UIView

@property (nonatomic, strong) void(^surePickerView)(DateModel* model);

@property (nonatomic, assign) id<DatePickerViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame;

@end
