//
//  WebViewController.m
//  iOSJiCheHui
//
//  Created by 吉车惠 on 16/12/15.
//  Copyright © 2016年 邢广范. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.webTitle;
        self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:RGB(0x333333)}];
    UIWebView *myWeb = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    NSURL *url = [NSURL URLWithString:self.webUrl];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [myWeb setDelegate:self];
    
    [myWeb loadRequest:request];
    
    
    [self.view addSubview:myWeb];

}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
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
