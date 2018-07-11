//
//  BaseTabBarViewController.m
//  MVCProject
//
//  Created by 黃秋陽 on 2018/7/10.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupItems];
    [self addChildVCs];
}

- (void)setupItems{
    UITabBarItem *tabItem = [UITabBarItem appearance];
    
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:12];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [tabItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [tabItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)addChildVCs{
    [self setupChildVC:[[FirstViewController alloc]init] title:@"First" image:@"" selectedImage:@""];
    [self setupChildVC:[[SecondViewController alloc]init] title:@"Second" image:@"" selectedImage:@""];
    [self setupChildVC:[[ThirdViewController alloc]init] title:@"Third" image:@"" selectedImage:@""];
    [self setupChildVC:[[FourthViewController alloc]init] title:@"Forth" image:@"" selectedImage:@""];
}

- (void)setupChildVC:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
//    设置导航控制器根控制器
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:viewController];
    [self addChildViewController:nav];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:image];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
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
