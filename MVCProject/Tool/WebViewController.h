//
//  WebViewController.h
//  iOSJiCheHui
//
//  Created by 吉车惠 on 16/12/15.
//  Copyright © 2016年 邢广范. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property(nonatomic,strong)NSString* webTitle;
@property(nonatomic,strong)NSString* webUrl;
@property(nonatomic,strong)NSString* type;//1代表navigationController右上角无图标
@end
