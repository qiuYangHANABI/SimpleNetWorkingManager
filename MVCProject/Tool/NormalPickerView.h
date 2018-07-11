//
//  NormalPickerView.h
//  iOSJiCheHui
//
//  Created by 邢广范 on 2016/12/22.
//  Copyright © 2016年 邢广范. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NormalPickerViewDelegate <NSObject>

- (void)clickbackView;

- (void)clickcancelButton;

@end

@interface NormalPickerView : UIView

@property (nonatomic, strong) NSArray *listArray;

@property (nonatomic, strong) void(^normalPickerView)(NSString* str);

@property (nonatomic, assign) id<NormalPickerViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame;

@end
