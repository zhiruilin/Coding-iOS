//
//  NSObject+PRReviewerCell.m
//  Coding_iOS
//
//  Created by hardac on 16/3/22.
//  Copyright © 2016年 Coding. All rights reserved.
//


#import "PRReviewerCell.h"

@interface PRReviewerCell ()
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *rightLabel;
@end

@implementation PRReviewerCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
         self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundColor = kColorTableBG;
        if (!_imgView) {
            _imgView = [UIImageView new];
            [self.contentView addSubview:_imgView];
            [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(20, 20));
                make.left.equalTo(self.contentView).offset(kPaddingLeftWidth);
                make.centerY.equalTo(self.contentView);
            }];
        }
        if (!_titleLabel) {
            _titleLabel = [UILabel new];
            _titleLabel.font = [UIFont systemFontOfSize:15];
            _titleLabel.textColor = [UIColor colorWithHexString:@"0x222222"];
            [self.contentView addSubview:_titleLabel];
            [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_imgView.mas_right).offset(15);
                make.right.equalTo(self.contentView).offset(-kPaddingLeftWidth);
                make.centerY.height.equalTo(self.contentView);
            }];
        }
        
        if (!self.rightLabel) {
            self.rightLabel = [UILabel new];
            self.rightLabel.text = @"添加";
            self.rightLabel.font = [UIFont systemFontOfSize:15];
            self.rightLabel.textColor = [UIColor colorWithHexString:@"0x222222"];
            [self.contentView addSubview:self.rightLabel];
            [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                //make.left.equalTo(_imgView.mas_right).offset(15);
                make.right.equalTo(self.contentView).offset(0);
                make.centerY.height.equalTo(self.contentView);
            }];
        }
    }
    return self;
}

- (void)prepareForReuse{
    [self removeTip];
}

- (void)addTip:(NSString *)countStr{
    self.accessoryType = UITableViewCellAccessoryNone;
    CGFloat pointX = kScreen_Width - 25;
    CGFloat pointY = [[self class] cellHeight]/2;
    [self.contentView addBadgeTip:countStr withCenterPosition:CGPointMake(pointX, pointY)];
}

- (void)addTipIcon{
    CGFloat pointX = kScreen_Width - 40;
    CGFloat pointY = [[self class] cellHeight]/2;
    [self.contentView addBadgeTip:kBadgeTipStr withCenterPosition:CGPointMake(pointX, pointY)];
}

- (void)addTipHeadIcon:(NSString *)IconString {
    CGFloat pointX = kScreen_Width - 40;
    CGFloat pointY = [[self class] cellHeight]/2;
    [self.contentView addBadgeTip:IconString withCenterPosition:CGPointMake(pointX, pointY)];
}

- (void)removeTip{
    [self.contentView removeBadgeTips];
}

- (void)setImageStr:(NSString *)imgStr andTitle:(NSString *)title{
    self.imgView.image = [UIImage imageNamed:imgStr];
    self.titleLabel.text = title;
}

+ (CGFloat)cellHeight{
    return 44.0;
}

@end
