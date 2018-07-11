//
//  BaseViewController.m
//  MVCProject
//
//  Created by 黃秋陽 on 2018/7/10.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

//访问网络的菊花
- (MBProgressHUD*)hud{
    if (!_hud) {
        _hud = [[MBProgressHUD alloc] initWithFrame:self.view.bounds];
        _hud.removeFromSuperViewOnHide = YES;
        _hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        _hud.backgroundView.color = [[UIColor grayColor] colorWithAlphaComponent:.4];
        //        _hud.mode = MBProgressHUDModeCustomView;
        //        //显示自定义gif
        //        _hud.customView = [[UIImageView alloc]initWithImage:[UIImage sd_animatedGIFNamed:@"加载008"]];
        _hud.mode = MBProgressHUDModeIndeterminate;
    }
    return _hud;
}
- (NetworkingManager*)networkingManager{
    if (!_networkingManager) {
        _networkingManager = [[NetworkingManager alloc] init];
    }
    return _networkingManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)showToastMessage:(NSString*)message{
    UIApplication* application = [UIApplication sharedApplication];
    _toastHud = [MBProgressHUD showHUDAddedTo:application.keyWindow animated:YES];
    if (!_toastHud) {
        _toastHud = [MBProgressHUD showHUDAddedTo:application.keyWindow animated:YES];
    }
    _toastHud.mode = MBProgressHUDModeText;
    _toastHud.label.text = message;
    _toastHud.label.numberOfLines = 0;
    _toastHud.offset = CGPointMake(0, MBProgressMaxOffset);
    [_toastHud hideAnimated:YES afterDelay:1.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
