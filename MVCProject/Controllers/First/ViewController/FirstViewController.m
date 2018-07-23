//
//  FirstViewController.m
//  MVCProject
//
//  Created by 黃秋陽 on 2018/7/10.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstOperator.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    example:
//params:请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"company_id"] = @"value";
    params[@"product_type"] = @"";
//operator:请求地址、请求方式、json->dic->model
    FirstOperator *operator = [[FirstOperator alloc]initWithParams:params];
    [self.networkingManager asyncTaskOnVC:self operator:operator successBlock:^(BaseModel *baseModel) {
        if ([baseModel.ret isEqualToString:@"1"]) {
            NSLog(@"%@, %@, %@", operator.data.string, operator.data.string2, operator.data.dataList);
        }
    } failBlock:^(BaseModel *baseModel) {
        [self showToastMessage:@"fail"];
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
