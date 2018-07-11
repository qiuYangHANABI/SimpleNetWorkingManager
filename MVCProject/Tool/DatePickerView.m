//
//  DatePickerView.m
//  iOSJiCheHui
//
//  Created by 邢广范 on 2016/12/22.
//  Copyright © 2016年 邢广范. All rights reserved.
//

#import "DatePickerView.h"
#import "DateModel.h"

@interface DatePickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, strong) NSMutableArray *yearArray;

@property (nonatomic, strong) NSMutableArray *monthArray;

@property (nonatomic, strong) NSMutableArray *dayArray;

@property (nonatomic, strong) DateModel *dateModel;

@end

@implementation DatePickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initData];
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
    [cancelBtn addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
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
    NSArray *array = [self gainSystemTime];
    NSString *yearRow = array[0];
    int year = [yearRow intValue] - 1970;
    NSString *monthStr = array[1];
    int month = [monthStr intValue];
    NSString *dayStr = array[2];
    int day = [dayStr intValue];
    
    //设置默认选中日期
    [self.pickerView selectRow:year inComponent:0 animated:YES];
    [self.pickerView selectRow:month - 1 inComponent:1 animated:YES];
    [self.pickerView selectRow:day - 1 inComponent:2 animated:YES];
    
    [self clearSeparatorWithView:_pickerView];
    
    [pickerBackView addSubview:self.pickerView];
    
}

- (void)initData
{
    NSArray *array = [self gainSystemTime];
    self.dateModel = [[DateModel alloc] init];
    self.dateModel.year = array[0];
    self.dateModel.month = array[1];
    self.dateModel.day = array[0];
    
    _yearArray = [NSMutableArray array];
    NSString *yearSystem = array[0];
    int yearCount = [yearSystem intValue];
    for (int i = 1970; i < yearCount + 30; i++) {
        NSString *year = [NSString stringWithFormat:@"%.2d",i];
        [_yearArray addObject:year];
    }
    
    _monthArray = [NSMutableArray array];
    for (int i = 1; i < 13; i++) {
        NSString *month = [NSString stringWithFormat:@"%.2d", i];
        [_monthArray addObject:month];
    }
    
    [self getDaysInMonth:[self.dateModel.month integerValue] withYear:[self.dateModel.year integerValue]];
    
}

#pragma mark -- pickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.yearArray.count;
    }else if (component == 1){
        return self.monthArray.count;
    }else{
        return self.dayArray.count;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 35;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return kScreenWidth / 3;
}

//改变选中那行的字体和颜色
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (!view){
        view = [[UIView alloc]init];
    }
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, (self.bounds.size.width-50)/3, 35)];

    text.textAlignment = NSTextAlignmentCenter;
    if (component==0) {
        text.text = [_yearArray objectAtIndex:row];
        self.dateModel.year = [_yearArray objectAtIndex:row];
    }
    if (component==1) {
        text.text = [_monthArray objectAtIndex:row];
        self.dateModel.month = [_monthArray objectAtIndex:row];
    }
    if (component==2) {
        text.text = [_dayArray objectAtIndex:row];
        self.dateModel.day = [_dayArray objectAtIndex:row];
    }
    [view addSubview:text];
    
    return view;
}

//被选择的行
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //滑动年份时，更新日
    if (component == 0) {
        NSInteger year = [_yearArray[row] integerValue];
        [self getDaysInMonth:[self.dateModel.month integerValue] withYear:year];
        [_pickerView reloadComponent:2];
    }
    
    //滑动月份时,更新日
    if (component ==1) {
        NSInteger moth = [_monthArray[row] integerValue];
        [self getDaysInMonth:moth withYear:[self.dateModel.year integerValue]];
        [_pickerView reloadComponent:2];
    }
    
    if (component==0) {
        self.dateModel.year = [_yearArray objectAtIndex:row];
    }
    if (component==1) {
        self.dateModel.month = [_monthArray objectAtIndex:row];
    }
    if (component==2) {
        self.dateModel.day = [_dayArray objectAtIndex:row];
    }
}

//让分割线背景颜色为透明
- (void)clearSeparatorWithView:(UIView * )view
{
    if(view.subviews != 0  )
    {
        //分割线很薄的
        if(view.bounds.size.height < 5)
        {
            view.backgroundColor = [UIColor clearColor];
        }
        
        [view.subviews enumerateObjectsUsingBlock:^( UIView *  obj, NSUInteger idx, BOOL *  stop) {
            [self clearSeparatorWithView:obj];
        }];
    }
    
}


- (void)cancelButtonClick:(DateModel *)model
{
    if ([self.delegate respondsToSelector:@selector(clickCancelButton)]) {
        [self.delegate  clickCancelButton];
    }
}

- (void)clickSureButton
{
    if (_surePickerView) {
        _surePickerView(self.dateModel);
    }
}

- (void)clickBackView
{
    if ([self.delegate respondsToSelector:@selector(clickBackViewTap)]) {
        [self.delegate clickBackViewTap];
    }
}

//获取某个月的天数
-(void)getDaysInMonth:(NSInteger)moth withYear:(NSInteger)year{
    int temp = 0;
    if (moth ==2) {
        if ([self iSRunYearWithYear:year]) {
          temp = 29;
        }else{
            temp = 28;
        }
    }else if(moth == 1||moth == 3||moth == 5||moth == 7||moth == 8||moth == 10||moth == 12){
        temp = 31;
    }else{
        temp = 30;
    }
    _dayArray = [NSMutableArray array];
    for (int i = 1; i<=temp; i++) {
        NSString *day = [NSString stringWithFormat:@"%.2d",i];
        [_dayArray addObject:day];
    }
}

//判断是否为闰年
- (BOOL)iSRunYearWithYear:(NSInteger)year
{
    if (year % 400 == 0) {
        return YES;
    }
    if (year % 100 == 0) {
        return NO;
    }
    if (year % 4 == 0) {
        return YES;
    }
    return NO;
}

//获取系统时间
- (NSArray *)gainSystemTime
{
    NSDate *date = [NSDate date];
    NSTimeInterval sec = [date timeIntervalSinceNow];
    NSDate *currentDate = [[NSDate alloc] initWithTimeIntervalSinceNow:sec];
    NSDateFormatter *datef = [[NSDateFormatter alloc] init];
    [datef setDateFormat:@"yyyy-MM-dd"];
    NSString *na = [datef stringFromDate:currentDate];
    return [na componentsSeparatedByString:@"-"];
}

@end
