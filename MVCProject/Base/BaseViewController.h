//
//  BaseViewController.h
//  MVCProject
//
//  Created by 黃秋陽 on 2018/7/10.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyConfig.h"
#import "MBProgressHUD.h"
#import "NetworkingManager.h"

@interface BaseViewController : UIViewController

@property (nonatomic, strong) MyConfig *config;
@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic, strong) MBProgressHUD *toastHud;
@property (nonatomic, strong) NetworkingManager *networkingManager;

- (void)showToastMessage:(NSString *)message;

@end
