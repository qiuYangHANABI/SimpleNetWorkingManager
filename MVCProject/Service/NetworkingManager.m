//
//  NetworkingManager.m
//  BaseProject
//
//  Created by zhangrongbing on 16/9/26.
//  Copyright © 2016年 lovcreate. All rights reserved.
//

#import "NetworkingManager.h"
#import "BaseViewController.h"
//#import "LoginViewController.h"
#import "IsNet.h"
typedef void (^successBlock)(BaseModel*);
typedef void (^failBlock)(BaseModel*);

@interface NetworkingManager()

@property(nonatomic, strong) AFHTTPSessionManager* manager;
@property(nonatomic, strong) BaseOperator* baseOperator;
@property(nonatomic, strong) BaseModel* baseModel;
@property(nonatomic, strong) BaseViewController* baseVC;

//回调块
@property(nonatomic, strong)successBlock successBlock;
@property(nonatomic, strong)failBlock failBlock;


@end

@implementation NetworkingManager

-(id)init{
    if (self = [super init]) {
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _manager.requestSerializer.timeoutInterval = 10.5f;
        _baseModel = [BaseModel new];
    }
    return self;
}

-(void)asyncTaskOnVC:(BaseViewController *)controller operator:(BaseOperator *)baseOperator successBlock:(void (^)(BaseModel *))successBlock failBlock:(void (^)(BaseModel *))failBlock{
    
    _baseOperator = baseOperator;
    _successBlock = successBlock;
    _failBlock = failBlock;
    _baseVC = controller;
    
//    if(![self checkNet]){
//        [_baseVC showToastMessage:@"网络未连接"];
//        _failBlock(_baseModel);
//        return;
//    }

    
    //隐藏掉键盘
    [_baseVC.view endEditing:YES];
    //显示菊花
    if (baseOperator.autoShowHud) {
//        [controller.view addSubview: controller.hud];
//        [controller.view bringSubviewToFront:controller.hud];
//        [controller.hud showAnimated:YES];
        controller.hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        controller.hud.removeFromSuperViewOnHide = YES;
        controller.hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        controller.hud.backgroundView.color = [[UIColor grayColor] colorWithAlphaComponent:.2];
        controller.hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        controller.hud.bezelView.color = [UIColor clearColor];
        //controller.hud.mode = MBProgressHUDModeIndeterminate;
        controller.hud.mode = MBProgressHUDModeCustomView;
        //        //显示自定义gif
        //        _hud.customView = [[UIImageView alloc]initWithImage:[UIImage sd_animatedGIFNamed:@"加载008"]];
        UIImageView *images = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 300)];
        NSMutableArray *imageArray = [[NSMutableArray alloc]init];
        for(int i = 1; i < 7 ; i++){
            NSString *imgName = [NSString stringWithFormat:@"loading%d.png",i];
            [imageArray addObject:[UIImage imageNamed:imgName]];
        }
        images.animationDuration = 0.3;
        images.animationImages = imageArray;
        // 开始播放
        [images startAnimating];
        controller.hud.customView = images;

    }
    //缓存--临时用。 以后扩展
//    if (baseOperator.canCache) {
//        NSString* responseString = [baseOperator.config.defaults objectForKey:baseOperator.action];
//        _baseModel.jsonString = responseString;
//        _successBlock(_baseModel);
//    }
    // 2.加上这个函数，https ssl 验证
    [_manager setSecurityPolicy:[self customSecurityPolicy]];
    [_manager.requestSerializer setValue:_baseVC.config.token forHTTPHeaderField:@"token"];
    if ([baseOperator.method isEqualToString:@"post"]) {
        [_manager POST:baseOperator.action parameters:baseOperator.params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self successMethodForTask:task responseObject:responseObject];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self failureMethodForTask:task error:error];
        }];
    }else if([baseOperator.method isEqualToString:@"get"]){
        [_manager GET:baseOperator.action parameters:baseOperator.params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self successMethodForTask:task responseObject:responseObject];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self failureMethodForTask:task error:error];
        }];
    }else if([baseOperator.method isEqualToString:@"delete"]){
        [_manager DELETE:baseOperator.action parameters:baseOperator.params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self successMethodForTask:task responseObject:responseObject];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self failureMethodForTask:task error:error];
        }];
    }
}

-(void)asyncUploadTaskOnVC:(BaseViewController*) controller operator:(BaseOperator*) baseOperator successBlock:(void(^)(BaseModel* baseModel)) successBlock failBlock:(void(^)(BaseModel* baseModel)) failBlock{
    _baseOperator = baseOperator;
    _successBlock = successBlock;
    _failBlock = failBlock;
    _baseVC = controller;
    
    //显示菊花
    if (baseOperator.autoShowHud) {
        [controller.view addSubview: controller.hud];
        [controller.hud showAnimated:YES];
    }
    //缓存--临时用。 以后扩展
//    if (baseOperator.canCache) {
//        NSString* responseString = [baseOperator.config.defaults objectForKey:baseOperator.action];
//        _baseModel.jsonString = responseString;
//        _successBlock(_baseModel);
//    }
    [_manager.requestSerializer setValue:_baseVC.config.token forHTTPHeaderField:@"token"];
    [_manager POST:baseOperator.action parameters:baseOperator.params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i = 0; i < _baseOperator.uploadKeys.count; i++) {
            NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmssSSS";
            NSString* fileName = [NSString stringWithFormat:@"%@%@.jpg", [formatter stringFromDate:[NSDate date]], @(i)];
            [formData appendPartWithFileData:_baseOperator.uploadDatas[i] name:_baseOperator.uploadKeys[i] fileName:fileName mimeType:@"image/jpeg"];
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self successMethodForTask:task responseObject:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self failureMethodForTask:task error:error];
    }];
}

//成功访问的方法
#warning 这里需要进行进一步的扩展
-(void)successMethodForTask:(NSURLSessionDataTask*) task responseObject:(id) responseObject{
    NSString* responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    //缓存
//    if(_baseOperator.canCache){
//        [_baseOperator.config.defaults setObject:responseString forKey:_baseOperator.action];
//    }
    _baseModel = [BaseModel mj_objectWithKeyValues:responseString];
    if([_baseModel.ret isEqualToString:@"0"]){
        NSLog(@"接口访问失败");
    }else  if([_baseModel.ret isEqualToString:@"1"]){
        NSLog(@"接口访问成功");
    }else if([_baseModel.ret isEqualToString:@"3"]){
        //异地登录弹窗
        UIAlertController *reLoginAlert = [UIAlertController alertControllerWithTitle:@"下线通知" message:@"您的账号在其他设备登录" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertA1 = [UIAlertAction actionWithTitle:@"重新登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self diffPlaceLogin];
        }];
        [reLoginAlert addAction:alertA1];
        [_baseVC presentViewController:reLoginAlert animated:YES completion:nil];

    }

    _baseModel.jsonString = responseString;
    NSLog(@"返回的数据=%@",_baseModel.jsonString);
    
//    sleep(1.);
    [_baseOperator parseJson:_baseModel];

    
    if (_baseOperator.autoShowHud) {
        [_baseVC.hud hideAnimated:YES];
    }
    _successBlock(_baseModel);
    
}

- (void)diffPlaceLogin{
    _baseOperator.config.token = @"";
    //异地登录
    if (_baseOperator.autoShowHud) {
        [_baseVC.hud hideAnimated:YES];
    }
//    LoginViewController* loginViewController = [[LoginViewController alloc]init];
//    [loginViewController setType:@"1"];
//    loginViewController.loginNetSuccessBlock = ^(NSInteger index){
//        NSLog(@"1111=%@",_baseVC);
//        _baseVC.tabBarController.selectedIndex = index;
//        [_baseVC.navigationController popToRootViewControllerAnimated:NO];
//    };
//    loginViewController.ageainNet = ^{
//        //            [_baseVC reNet];
//        _baseVC.tabBarController.selectedIndex = 0;
//        [_baseVC.navigationController popToRootViewControllerAnimated:NO];
//    };
//    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:loginViewController];
//    [_baseVC presentViewController:nav animated:YES completion:nil];
    return;
}

//失败执行方法
-(void)failureMethodForTask:(NSURLSessionDataTask*) task error:(NSError*) error{
    if(error.code == -1001){
        if (self.timeOutMessage.length > 0) {
            [_baseVC showToastMessage:self.timeOutMessage];
        }else{
            [_baseVC showToastMessage:@"服务器连接超时"];
        }
    }else if(error.code == -1004){
        [_baseVC showToastMessage:@"无法连接服务器"];
    }else if(error.code == -1009){
        [_baseVC showToastMessage:@"网络未连接"];
    }
    
    if (_baseOperator.autoShowHud) {
        [_baseVC.hud hideAnimated:NO];
    }
    _failBlock(_baseModel);
}
//判断网络状态
-(BOOL)checkNet{
    IsNet* isNet = [IsNet shareIsNet];
    if(isNet.netType == KNetNone){
        return NO;
    }
    return YES;
}
-(AFSecurityPolicy *)customSecurityPolicy {
    NSString *cerPath;
//    if ([ENVIRONMENT isEqualToString:@"development"]) {
//        cerPath = [[NSBundle mainBundle] pathForResource:@"dev_der" ofType:@"cer"];
//    }else if ([ENVIRONMENT isEqualToString:@"debug"]){
//        cerPath = [[NSBundle mainBundle] pathForResource:@"cs_der" ofType:@"cer"];
//    }else if ([ENVIRONMENT isEqualToString:@"release"]){
//        cerPath = [[NSBundle mainBundle] pathForResource:@"ylcf" ofType:@"cer"];
//    }
    
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    [securityPolicy setPinnedCertificates:[NSSet setWithObjects:cerData, nil]];
    // allowInvalidCertificates 是否允许无效证书(也就是自建的证书)，默认为NO
    securityPolicy.allowInvalidCertificates = YES;
    //validatesDomainName 是否需要验证域名，默认为YES;
    securityPolicy.validatesDomainName = YES;
    return securityPolicy;
}
@end
