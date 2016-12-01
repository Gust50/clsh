//
//  CLSHConfirmOrderShopDetailDescribeCell.m
//  ClshUser
//
//  Created by wutaobo on 16/6/3.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "CLSHConfirmOrderShopDetailDescribeCell.h"
#import "Masonry.h"
#import "KBLabel.h"
#import "CLSHPurchaseModel.h"

@interface CLSHConfirmOrderShopDetailDescribeCell ()

@property (nonatomic, strong) UIImageView *shopIcon;
@property (nonatomic, strong) UILabel *shopDescribe;
@property (nonatomic, strong) UILabel *shopPrice;
@property (nonatomic, strong) KBLabel *discountPrice;
@property (nonatomic, strong) UILabel *shopCount;
@property (nonatomic, strong) UILabel *bottomLine;

@property (nonatomic, assign) CGFloat shopPriceWidth;


@end

@implementation CLSHConfirmOrderShopDetailDescribeCell

#pragma mark-getter setter
-(UIImageView *)shopIcon{
    if (!_shopIcon) {
        _shopIcon=[[UIImageView alloc]init];
        _shopIcon.image = [UIImage imageNamed:@"ProductPicture"];
    }
    return _shopIcon;
}

-(UILabel *)shopDescribe{
    if (!_shopDescribe) {
        _shopDescribe=[[UILabel alloc]init];
        _shopDescribe.textColor = RGBColor(51, 51, 51);
        _shopDescribe.font = [UIFont systemFontOfSize:13*pro];
        _shopDescribe.text = @"【 周黑鸭 】真空桶头鸭锁骨 休闲美食";
        _shopDescribe.numberOfLines = 0;
    }
    return _shopDescribe;
}

-(UILabel *)shopPrice{
    if (!_shopPrice) {
        _shopPrice=[[UILabel alloc]init];
        _shopPrice.textColor = RGBColor(242, 51, 47);
        _shopPrice.font = [UIFont systemFontOfSize:14*pro];
        _shopPrice.text = @"48.00";
        
    }
    return _shopPrice;
}

-(KBLabel *)discountPrice{
    if (!_discountPrice) {
        _discountPrice=[[KBLabel alloc]init];
        _discountPrice.textColor = RGBColor(102, 102, 102);
        _discountPrice.font = [UIFont systemFontOfSize:10*pro];
        _discountPrice.textAlignment = NSTextAlignmentLeft;
        _discountPrice.text = @"68.00";
        _discountPrice.type = middleLine;
        _discountPrice.labelFont = [UIFont systemFontOfSize:10*pro];
        _discountPrice.lineColor = RGBColor(102, 102, 102);
        
    }
    return _discountPrice;
}

-(UILabel *)bottomLine{
    if (!_bottomLine) {
        _bottomLine=[[UILabel alloc]init];
        _bottomLine.backgroundColor = RGBColor(212, 212, 212);
    }
    return _bottomLine;
}

-(UILabel *)shopCount{
    if (!_shopCount) {
        _shopCount=[[UILabel alloc]init];
        _shopCount.textColor = RGBColor(51, 51, 51);
        _shopCount.font = [UIFont systemFontOfSize:10*pro];
        _shopCount.text = @"数量X2";
        _shopCount.textAlignment = NSTextAlignmentRight;
    }
    return _shopCount;
}

#pragma mark-init UI
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    [self addSubview:self.shopIcon];
    [self addSubview:self.shopDescribe];
    [self addSubview:self.shopPrice];
//    [self addSubview:self.discountPrice];
    [self addSubview:self.bottomLine];
    [self addSubview:self.shopCount];
    
    [self updateConstraints];
}

#pragma mark-updateUI
-(void)updateConstraints{
    [super updateConstraints];
    
    WS(weakSelf);
    [_shopIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).with.offset(10*pro);
        make.size.mas_equalTo(CGSizeMake(60*pro, 60*pro));
    }];
    
    [_shopDescribe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(15*pro);
        make.left.equalTo(_shopIcon.mas_right).with.offset(10*pro);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10*pro);
        make.height.mas_equalTo(@(20*pro));
    }];
    [_shopPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_shopDescribe.mas_bottom).with.offset(20*pro);
        make.left.equalTo(_shopIcon.mas_right).with.offset(10*pro);
        make.height.mas_equalTo(@(20*pro));
    }];
    
    [_shopPrice mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(self.shopPriceWidth));
    }];
    
    [_shopCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_shopDescribe.mas_bottom).with.offset(22*pro);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10*pro);
        make.size.mas_equalTo(CGSizeMake(60*pro, 20*pro));
    }];
//    [_discountPrice mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_shopDescribe.mas_bottom).with.offset(22*pro);
//        make.left.equalTo(_shopPrice.mas_right).with.offset(5*pro);
//        make.right.equalTo(_shopCount.mas_left);
//        make.height.mas_equalTo(@(20*pro));
//    }];
    
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_bottom).with.offset(-1);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.mas_equalTo(@(1));
    }];
}

#pragma mark - setter getter
-(void)setPurchaseOrderItemsModel:(CLSHPurchaseOrderItemsModel *)purchaseOrderItemsModel
{
    _purchaseOrderItemsModel = purchaseOrderItemsModel;
    [_shopIcon sd_setImageWithURL:[NSURL URLWithString:purchaseOrderItemsModel.image] placeholderImage:nil];
    _shopDescribe.text = purchaseOrderItemsModel.goodsName;
    NSString *shopPriceStr = [[NSString numberFormatter] stringFromNumber:[NSNumber numberWithFloat:purchaseOrderItemsModel.price]];
    _shopPrice.text = shopPriceStr;
    CGSize shopPriceSize = [NSString sizeWithStr:_shopPrice.text font:[UIFont systemFontOfSize:16*pro] width:120];
    [self.discountPrice mas_updateConstraints:^(MASConstraintMaker *make) {
        self.shopPriceWidth = shopPriceSize.width;
    }];
    NSString *discountPriceStr = [[NSString numberFormatter] stringFromNumber:[NSNumber numberWithFloat:purchaseOrderItemsModel.marketPrice]];
    _discountPrice.text = discountPriceStr;
    _shopCount.text = [NSString stringWithFormat:@"数量X%.f", purchaseOrderItemsModel.quantity];
}

@end
