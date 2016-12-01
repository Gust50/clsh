//
//  CLGSPaymentOrderSecondCell.m
//  粗粮
//
//  Created by 吴桃波 on 16/4/25.
//  Copyright © 2016年 胡天虎. All rights reserved.
//

#import "CLGSPaymentOrderSecondCell.h"

@interface CLGSPaymentOrderSecondCell ()
//约束
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UILabel *label3;
@property (strong, nonatomic) IBOutlet UILabel *label4;
@property (strong, nonatomic) IBOutlet UILabel *label5;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label1Tap;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label1Height;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label1Width;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label2Tap;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label2Height;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label2Width;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label3Tap;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label3Height;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label3Width;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label4Tap;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label4Height;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label4Width;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label5Tap;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label5Height;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *label5Width;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *right1Tap;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *right1Height;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *right2Tap;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *right2Height;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *right3Tap;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *right3Height;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *right4Tap;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *right4Height;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *right5Tap;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *right5Height;


//类型
@property (strong, nonatomic) IBOutlet UILabel *type;
//时间
@property (strong, nonatomic) IBOutlet UILabel *time;
//流水号
@property (strong, nonatomic) IBOutlet UILabel *sn;
//剩余金额
@property (strong, nonatomic) IBOutlet UILabel *money;
//备注
@property (strong, nonatomic) IBOutlet UILabel *explain;

@end

@implementation CLGSPaymentOrderSecondCell
//修改字体
- (void)modify
{
    self.label1Tap.constant = 17*pro;
     self.label1Height.constant = 15*pro;
    self.right1Tap.constant = 17*pro;
    self.right1Height.constant = 15*pro;
     self.label1Width.constant = 50*pro;
    self.label2Tap.constant = 15*pro;
    self.label2Height.constant = 15*pro;
    self.right2Tap.constant = 15*pro;
    self.right2Height.constant = 15*pro;
    self.label2Width.constant = 50*pro;
    self.label3Tap.constant = 15*pro;
    self.label3Height.constant = 15*pro;
    self.right3Tap.constant = 15*pro;
    self.right3Height.constant = 15*pro;
    self.label3Width.constant = 50*pro;
    self.label4Tap.constant = 15*pro;
    self.label4Height.constant = 15*pro;
    self.right4Tap.constant = 15*pro;
    self.right4Height.constant = 15*pro;
    self.label4Width.constant = 50*pro;
    self.label5Tap.constant = 15*pro;
    self.label5Height.constant = 15*pro;
    self.right5Tap.constant = 15*pro;
    self.right5Height.constant = 15*pro;
    self.label5Width.constant = 50*pro;
    self.label1.font = [UIFont systemFontOfSize:12*pro];
    self.label2.font = [UIFont systemFontOfSize:12*pro];
    self.label3.font = [UIFont systemFontOfSize:12*pro];
    self.label4.font = [UIFont systemFontOfSize:12*pro];
    self.label5.font = [UIFont systemFontOfSize:12*pro];
    self.type.font = [UIFont systemFontOfSize:12*pro];
    self.time.font = [UIFont systemFontOfSize:12*pro];
    self.sn.font = [UIFont systemFontOfSize:12*pro];
    self.type.font = [UIFont systemFontOfSize:12*pro];
    self.money.font = [UIFont systemFontOfSize:12*pro];
    self.explain.font = [UIFont systemFontOfSize:12*pro];
    self.type.textColor = RGBColor(66, 66, 66);
    self.time.textColor = RGBColor(66, 66, 66);
    self.sn.textColor = RGBColor(66, 66, 66);
    self.money.textColor = RGBColor(66, 66, 66);
    self.explain.textColor = RGBColor(66, 66, 66);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self modify];
}

#pragma mark - setter getter
-(void)setIncomeAndExpendDetailModel:(CLSHAccountIncomeAndExpendDetailModel *)incomeAndExpendDetailModel
{
    _incomeAndExpendDetailModel = incomeAndExpendDetailModel;
    self.sn.text = incomeAndExpendDetailModel.sn;
    NSString *balance = [[NSString numberFormatter] stringFromNumber:[NSNumber numberWithFloat:incomeAndExpendDetailModel.balance]];
    self.money.text = balance;
    self.explain.text = incomeAndExpendDetailModel.memo;
    CGSize size = [NSString sizeWithStr:self.explain.text font:[UIFont systemFontOfSize:14] width:SCREENWIDTH-120*pro];
    self.label5Height.constant = size.height;
    if (!incomeAndExpendDetailModel.credit) {
        self.type.text = @"支出";
    }else
    {
        self.type.text = @"收入";
    }
    //时间戳
    double lastactivityInterval = incomeAndExpendDetailModel.createDate /1000;
    NSDateFormatter* formatterr = [[NSDateFormatter alloc] init];
    formatterr.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatterr setDateStyle:NSDateFormatterMediumStyle];
    [formatterr setTimeStyle:NSDateFormatterShortStyle];
    [formatterr setDateFormat:@"yyyy/MM/dd  HH:mm:ss"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:lastactivityInterval];
    self.time.text = [formatterr stringFromDate:date];
    
}

@end
