//
//  CheckUtils.h
//  XiaoLvOA
//
//  Created by C on 16/9/22.
//  Copyright © 2016年 fuweihan00. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckUtils : NSObject

//验证手机号
+(NSString*)checkPhone:(NSString*)phone;
//验证密码
+(NSString*)checkPassword:(NSString*)password;
//验证确认密码
+(NSString*)checkPasswordConfirm:(NSString*)password;
//验证验证码
+(NSString*)checkCode:(NSString*)code;
//验证车牌号
+(NSString *)checkCarNum:(NSString *)carNum;
//验证教练车车牌号
+(NSString *)checkCoachCarNum:(NSString *)carNum;
//验证车架号
+(NSString *)checkCarVin:(NSString *)carvin;
//验证车架号后六位
+(NSString *)checkCarVinSixNum:(NSString *)carvinSixNum;
//验证身份证号
+(NSString *)checkIDCardNum:(NSString *)idNum;
//验证档案编号后四位
+(NSString *)checkOmitNum:(NSString *)omitNum;
//验证发动机号
+(NSString *)checkEngineNum:(NSString *)engineNum;
//验证车辆所有人姓名
+(NSString *)checkChines:(NSString *)chines;
//验证地址姓名
+(NSString *)checkAddressOwn:(NSString *)name;
//验证油卡密码
+(NSString *)checkOilPassword:(NSString *)oilPass;
//验证驾驶证号码
+(NSString *)checkDrivingId:(NSString *)idNum;
//验证证芯编号后6位
+(NSString *)checkVinNum:(NSString *)vinNum;
//验证公司名称
+(NSString *)checkCompanyName:(NSString *)cpnName;
//验证纳税人识别号
+(NSString *)checkCompanyTaxID:(NSString *)ctID;
//验证开户行
+(NSString *)checkCompanyBankName:(NSString *)cbName;
//验证银行账号
+(NSString *)checkCompanyAccountID:(NSString *)caID;
//验证联系电话
+(NSString *)checkCompanyTel:(NSString *)ctNum;
//验证发票地址
+(NSString *)checkCompanyAdd:(NSString *)cAdd;
//验证收货地址
+(NSString *)checkMineAddress:(NSString *)address;
@end
