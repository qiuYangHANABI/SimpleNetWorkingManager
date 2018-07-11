//
//  FirstViewController.m
//  MVCProject
//
//  Created by 黃秋陽 on 2018/7/10.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import "FirstViewController.h"
#import "MyConfig.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"key"] = @"value";
    BaseOperator *operator = [[BaseOperator alloc]initWithParams:params];
    [self.networkingManager asyncTaskOnVC:self operator:operator successBlock:^(BaseModel *baseModel) {
        
    } failBlock:^(BaseModel *baseModel) {
        
    }];
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