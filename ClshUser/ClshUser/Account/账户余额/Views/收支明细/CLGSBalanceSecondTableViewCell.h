//
//  CLGSBalanceSecondTableViewCell.h
//  粗粮
//
//  Created by 吴桃波 on 16/4/23.
//  Copyright © 2016年 胡天虎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLSHAccountBalanceModel.h"

//收支明细2
@interface CLGSBalanceSecondTableViewCell : UITableViewCell

/** 传入收入和支出理列表数据模型*/
@property (nonatomic, strong) CLSHAccountIncomeAndExpendListModel *incomeAndExpendListModel;
@end
