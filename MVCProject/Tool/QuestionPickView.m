//
//  NormalPickerView.m
//  iOSJiCheHui
//
//  Created by 邢广范 on 2016/12/22.
//  Copyright © 2016年 邢广范. All rights reserved.
//

#import "QuestionPickView.h"

@interface QuestionPickView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, copy) NSString *selectString;
@property(nonatomic,assign)NSInteger rowIndex;
@end

@implementation QuestionPickView

- (void)setListArray:(NSArray *)listArray
{
    _listArray = listArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.backgroundColor = [UIColor clearColor];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 250 * kFitHeight - 41)];
    backView.backgroundColor = RGBA(0x000000, 0.5);
    [self addSubview:backView];
    UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBackView)];
    [backView addGestureRecognizer:backTap];
    
    UIView *pickerBackView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 250 * kFitHeight - 41, kScreenWidth, 250 * kFitHeight + 41)];
    pickerBackView.backgroundColor = [UIColor whiteColor];
    [self addSubview:pickerBackView];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(15, 11, 40, 18);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:RGB(0x656565) forState:UIControlStateNormal];
    cancelBtn.backgroundColor = [UIColor clearColor];
    [cancelBtn addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [pickerBackView addSubview:cancelBtn];
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sureButton.frame = CGRectMake(kScreenWidth - 55, 11, 40, 18);
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [sureButton setTitleColor:RGB(0x299EEB) forState:UIControlStateNormal];
    sureButton.backgroundColor = [UIColor clearColor];
    [sureButton addTarget:self action:@selector(clickSureButton) forControlEvents:UIControlEventTouchUpInside];
    [pickerBackView addSubview:sureButton];
    
    UIView *separateView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, kScreenWidth, 1)];
    separateView.backgroundColor = RGB(0xE6E6E6);
    [pickerBackView addSubview:separateView];
    
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 41, kScreenWidth, 250 * kFitHeight)];
    _pickerView.backgroundColor = [UIColor clearColor];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    [pickerBackView addSubview:_pickerView];
    
}

//UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件包含的列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

//UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件指定列包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.listArray.count;
}

// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为UIPickerView中指定列和列表项的标题文本
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    self.selectString = self.listArray[row];
    return self.listArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectString = self.listArray[row];
    self.rowIndex = row;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 35;
}

//改变选中那行的字体和颜色
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (!view){
        view = [[UIView alloc]init];
    }
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 35)];
    text.textAlignment = NSTextAlignmentCenter;
    
    text.text = [_listArray objectAtIndex:row];
    self.selectString = [_listArray objectAtIndex:row];
    [view addSubview:text];
    
    return view;
}

- (void)clickBackView
{
    if ([self.delegate respondsToSelector:@selector(clickbackView)]) {
        [self.delegate clickbackView];
    }
}

- (void)cancelButtonClick
{
    if ([self.delegate respondsToSelector:@selector(clickcancelButton)]) {
        [self.delegate clickcancelButton];
    }
}

- (void)clickSureButton
{
    if(_normalPickerView){
        _normalPickerView(self.selectString,self.rowIndex);
    }
}

@end
