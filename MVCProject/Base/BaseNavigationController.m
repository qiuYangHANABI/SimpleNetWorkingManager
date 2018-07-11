//
//  BaseNavigationController.m
//  MVCProject
//
//  Created by 黃秋陽 on 2018/7/10.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
}

+ (void)initialize{
//    导航栏标题
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"image"] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *navBarAttrs = [NSMutableDictionary dictionary];
    navBarAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17];
    [navigationBar setTitleTextAttributes:navBarAttrs];
//    导航栏item基础设置
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [barItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *disableAttrs = [NSMutableDictionary dictionary];
    disableAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [barItem setTitleTextAttributes:disableAttrs forState:UIControlStateDisabled];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //非首页设置返回键
    if (self.childViewControllers.count >= 1) {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [backBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        [backBtn sizeToFit];
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpOutside];
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    viewController.view.backgroundColor = [UIColor whiteColor];
    [super pushViewController:viewController animated:animated];
}
- (void)back{
    [self popViewControllerAnimated:YES];
}

#pragma mark -- UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
//    非首页返回手势成立，否者取消手势
    return self.childViewControllers.count > 1;
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
