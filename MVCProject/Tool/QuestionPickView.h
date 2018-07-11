//
//  QuestionPickView.h
//  iOSJiCheHui
//
//  Created by 吉车惠 on 16/12/30.
//  Copyright © 2016年 邢广范. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol QuestionPickerViewDelegate <NSObject>

- (void)clickbackView;

- (void)clickcancelButton;

@end
@interface QuestionPickView : UIView
@property (nonatomic, strong) NSArray *listArray;

@property (nonatomic, strong) void(^normalPickerView)(NSString* str,NSInteger index);//选择的字符串和下标

@property (nonatomic, assign) id<QuestionPickerViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame;

@end
