//
//  CheckUtils.m
//  XiaoLvOA
//
//  Created by C on 16/9/22.
//  Copyright © 2016年 fuweihan00. All rights reserved.
//

#import "CheckUtils.h"

@implementation CheckUtils
+(NSString*)checkPhone:(NSString*)phone{
    if(phone.length==0){
        return @"请输入手机号";
    }else{
        NSString *regex = @"^1(3|4|5|6|7|8|9)\\d{9}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:phone];
        if(!isMatch){
            return @"手机号格式不正确";
        }
        if(phone.length !=11){
            return @"手机号格式不正确";
        }
    }
    return nil;
}

+(NSString*)checkPassword:(NSString*)password{
    if (password.length == 0) {
        return @"请输入密码";
    }else if (password.length < 8 || password.length > 18){
        return @"请输入8-18位字母数字混合密码";
    }else{
        NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,18}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:password];
        if(!isMatch){
            //return @"您的密码强度过低，请重新输入";
            return @"请输入8-18位字母数字混合密码";
        }
    }
    return nil;
}
+(NSString*)checkCode:(NSString*)code{
    if(code.length==0){
        return @"请输入验证码";
    }
    return nil;
}
+(NSString*)checkPasswordConfirm:(NSString*)password{
    if(password.length==0){
        return @"确认密码不能为空";
    }
    if(password.length<6){
        return @"确认密码不能少于6位";
    }
    return nil;
}

+(NSString *)checkIDCardNum:(NSString *)idNum
{
    if (idNum.length == 0) {
        return @"请输入身份证号";
    }else{
        NSString *regex = @"(\\d{14}[0-9a-zA-Z])|(\\d{16}[0-9a-zA-Z][0-9])|(\\d{16}[0-9a-zA-Z][X])";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:idNum];
        if(!isMatch){
            return @"身份证号格式不正确";
        }
    }
    return nil;
}

+(NSString *)checkOmitNum:(NSString *)omitNum
{
    if (omitNum.length == 0) {
        return @"请输入档案编号后四位";
    }else{
        NSString *regex = @"[0-9]{4}";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:omitNum];
        if (!isMatch) {
            return @"档案编号后四位格式不正确";
        }
    }
    return nil;
}

+(NSString *)checkCarNum:(NSString *)carNum
{
    if (carNum.length == 0) {
        return @"请输入车牌号";
    }else{
        NSString *regex = @"[\\u4e00-\\u9fa5][A-z][A-z0-9]{5}"; 
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:carNum];
        if (!isMatch) {
            return @"车牌号格式不正确";
        }
    }
    return nil;
}

+(NSString *)checkCoachCarNum:(NSString *)carNum
{
    if (carNum.length == 0) {
        return @"请输入车牌号";
    }else{
        NSString *regex = @"[\\u4e00-\\u9fa5][A-z][\\u4e00-\\u9fa5][A-z0-9]{4}";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:carNum];
        if (!isMatch) {
            return @"车牌号格式不正确";
        }
    }
    return nil;
}

+(NSString *)checkCarVin:(NSString *)carvin
{
    if (carvin.length == 0) {
        return @"请输入车架号";
    }else{
        NSString *regex = @"[A-z0-9]{17}";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:carvin];
        if (!isMatch) {
            return @"车架号格式不正确";
        }
    }
    return nil;
}

+(NSString *)checkCarVinSixNum:(NSString *)carvinSixNum
{
    if (carvinSixNum.length == 0) {
        return @"请输入车架号";
    }else{
        NSString *regex = @"[A-z0-9]{6}";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:carvinSixNum];
        if (!isMatch) {
            return @"车架号格式不正确";
        }
    }
    return nil;
}

+(NSString *)checkEngineNum:(NSString *)engineNum
{
    if (engineNum.length == 0) {
        return @"请输入发动机号";
    }else{
        NSString *regex = @"[0-9]{7,8}";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:engineNum];
        if (!isMatch) {
            return @"发动机号格式不正确";
        }
    }
    return nil;
}

+(NSString *)checkChines:(NSString *)chines
{
    if (chines.length == 0) {
        return @"请输入车辆所有人姓名";
    }else{
        NSString *regex = @"[\u4e00-\u9fa5]+";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:chines];
        if (!isMatch) {
            return @"车辆所有人姓名格式不正确";
        }
    }
    return nil;
}

+(NSString *)checkOilPassword:(NSString *)oilPass
{
    if (oilPass.length == 0) {
        return @"请输入支付密码";
    }else if (oilPass.length != 6){
        return @"请输入6位数字密码";
    }else{
        NSString *regex = @"[0-9]*";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:oilPass];
        if (!isMatch) {
            return @"请输入6位数字密码";
        }
    }
    return nil;
}

+(NSString *)checkAddressOwn:(NSString *)name
{
    if (name.length == 0) {
        return @"请输入姓名";
    }else{
        NSString *regex = @"[\u4e00-\u9fa5]+";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:name];
        if (!isMatch) {
            return @"姓名格式不正确";
        }
    }
    return nil;
}

+(NSString *)checkDrivingId:(NSString *)idNum
{
    if (idNum.length == 0) {
        return @"请输入驾驶证号码";
    }else{
        NSString *regex = @"(\\d{14}[0-9a-zA-Z])|(\\d{16}[0-9a-zA-Z][0-9])|(\\d{16}[0-9a-zA-Z][Xx])";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:idNum];
        if(!isMatch){
            return @"驾驶证号码格式不正确";
        }
    }
    return nil;
}

+(NSString *)checkVinNum:(NSString *)vinNum
{
    if (vinNum.length == 0) {
        return @"请输入证芯编号后6位";
    }else{
        NSString *regex = @"[0-9]{6}";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:vinNum];
        if(!isMatch){
            return @"证芯编号后6位格式不正确";
        }
    }
    return nil;
}
//只能通过汉字及中文圆括号
+(NSString *)checkCompanyName:(NSString *)cpnName{
    if (cpnName.length == 0) {
        return @"请输入公司名称";
    }else if(cpnName.length > 50){
        return @"公司名称格式不正确";
    }else if([cpnName containsString:@"()"]||[cpnName containsString:@")"]||[cpnName containsString:@"("]){
        return @"公司名称格式不正确";
    }else{
        NSString *regex = @"[\u4e00-\u9fa5（）]+";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:cpnName];
        if (!isMatch) {
            return @"公司名称格式不正确";
        }
    }
    return nil;
}
+(NSString *)checkCompanyTaxID:(NSString *)ctID{
    if (ctID.length == 0) {
        return @"请输入纳税人识别号";
    }else if (ctID.length > 20){
        return @"纳税人识别号格式不正确";
    }else{
        NSString *regex = @"^[A-z0-9]*";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:ctID];
        if (!isMatch) {
            return @"纳税人识别号格式不正确";
        }
    }
    return nil;
}
+(NSString *)checkCompanyBankName:(NSString *)cbName{
    if (cbName.length == 0) {
        return @"请输入开户行名称";
    }else if (cbName.length > 50){
        return @"开户行格式不正确";
    }else{
        NSString *regex = @"[A-Za-z\u4e00-\u9fa5]*";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:cbName];
        if (!isMatch) {
            return @"开户行格式不正确";
        }
    }
    return nil;
}
+(NSString *)checkCompanyAccountID:(NSString *)caID{
    if (caID.length == 0) {
        return @"请输入开户行账号";
    }else if (caID.length > 50){
        return @"开户行账号格式不正确";
    }else{
        NSString *regex = @"[0-9]*";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:caID];
        if (!isMatch) {
            return @"开户行账号格式不正确";
        }
    }
    return nil;
}
+(NSString *)checkCompanyTel:(NSString *)ctNum{
    if (ctNum.length == 0) {
        return @"请输入公司联系电话";
    }else if(ctNum.length > 20){
        return @"公司联系电话格式不正确";
    }else{
        NSString *regex = @"[0-9]*";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:ctNum];
        if (!isMatch) {
            return @"公司联系电话格式不正确";
        }
    }
    return nil;
}
+(NSString *)checkCompanyAdd:(NSString *)cAdd{
    if (cAdd.length == 0) {
        return @"请输入公司地址";
    }else if (cAdd.length > 100){
        return @"公司地址格式不正确";
    }
    return nil;
}
+ (NSString *)checkMineAddress:(NSString *)address{
    
    if (address.length == 0) {
        return @"请输入60字以内详细地址";
    }else if(address.length > 60){
        return @"请输入60字以内详细地址";
    }else{
        NSString *regex = @"[A-z0-9\u4e00-\u9fa5-()，。,. ]*";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isMatch = [pred evaluateWithObject:address];
        if (!isMatch) {
            return @"地址格式不正确";
        }
    }
    return nil;
}

@end
