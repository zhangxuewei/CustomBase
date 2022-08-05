//
//  Tool.m
//  CustomLib1
//
//  Created by zhangxuewei on 2022/8/5.
//

#import "Tool.h"

@implementation Tool


 

#pragma mark  正则判断手机号是否正确

+ (BOOL)validateNumber:(NSString *) textString

{

    NSString* number=@"^1[3|4|5|7|8][0-9]\\d{8}$";

    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];

    return [numberPre evaluateWithObject:textString];

}

 

#pragma mark 正则判断身份证号

+ (BOOL) validateIdentityCard: (NSString *)identityCard

{

    BOOL flag;

    if (identityCard.length <= 0) {

        flag = NO;

        return flag;

    }

    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";

    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];

    return [identityCardPredicate evaluateWithObject:identityCard];

}

 

 

 

#pragma mark 正则判断快递单号

+ (BOOL) validateEMSnumber: (NSString *)EMSnumber

{

    BOOL flag;

    if (EMSnumber.length <= 0) {

        flag = NO;

        return flag;

    }

    NSString * reg = @"^[0-9a-zA-Z]{10,}$";

    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",reg];

    return [identityCardPredicate evaluateWithObject:EMSnumber];

}

 

 

 

#pragma mark 正则判断取现金额

+ (BOOL) validateCashMoney: (NSString *)cashMoney

{

    BOOL flag;

    if (cashMoney.length <= 0) {

        flag = NO;

        return flag;

    }

    NSString * reg = @"^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){1,2})?$";

    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",reg];

    return [identityCardPredicate evaluateWithObject:cashMoney];

}

 

#pragma mark - 正则判断100的整数倍

+ (BOOL)judge100IntegerTimes:(NSString *)str

{

    NSString *remainderStr = [NSString stringWithFormat:@"%d", [str intValue] % 100];

    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^[0]$"];

    return [numberPre evaluateWithObject:remainderStr];

    

}

 

#pragma mark 正则判断登录密码是否正确(6-20位数字字母结合)

+ (BOOL)validateNumberOrLetter:(NSString *) textString

{

    BOOL result = false;

    if ([textString length] >= 6){

        

        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";

        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];

        result = [pred evaluateWithObject:textString];

    }

    return result;

}

 

 

#pragma mark 正则简单判断银行卡号是否正确(16-19位数字)

+ (BOOL)validateBankCardNumber:(NSString *)textString

{

    NSString* number=@"^([0-9]{16}|[0-9]{19})$";

    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];

    return [numberPre evaluateWithObject:textString];

}

 

 

#pragma mark 手机号码中间变*

+(NSString * )cipherchangeText:(NSString * )changetext firstOne:(NSInteger )firstOne lenght:(NSInteger)lenght{

    NSString * number = [changetext stringByReplacingCharactersInRange:NSMakeRange(firstOne, lenght) withString:@"****"];

    return number;

}

 

 

#pragma mark 获取手机UUID

+(NSString * )uuid{

    NSString * uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];

    return uuid;

}

 

 

#pragma mark 自适应高度

+(CGRect)sizeOfText:(NSString * )text Width:(CGFloat )width Font:(CGFloat)fontFloat{

    NSDictionary * textDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:fontFloat],NSFontAttributeName, nil];

    CGRect rect  = [text boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:textDic context:nil];

    return rect;

}

 

 

#pragma mark  自适应宽度

+(CGRect)sizeOfText:(NSString * )text Height:(CGFloat)height Font:(CGFloat)fontFloat{

    NSDictionary * textDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:fontFloat],NSFontAttributeName, nil];

    CGRect rect = [text boundingRectWithSize:CGSizeMake(0, height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:textDic context:nil];

    return rect;

}

 

#pragma mark  图片等比压缩

+ (CGFloat)zoomImageScaleWithImage:(UIImage * )image withWidth:(CGFloat )width

{

    UIImage *newImage;

    

    //判断如果图片的SIZE的宽度大于屏幕的宽度就让它压缩

//    if (image.size.width > width) {

        //开始压缩图片

        CGSize size = image.size;

        

        UIGraphicsBeginImageContext(CGSizeMake(width, width * size.height / size.width));

        

        [image drawInRect:CGRectMake(0, 0, width, width * size.height / size.width)];

        

        newImage = UIGraphicsGetImageFromCurrentImageContext();

        

        UIGraphicsEndImageContext();

        

 

//    }

        return newImage.size.height;

}

 
@end
