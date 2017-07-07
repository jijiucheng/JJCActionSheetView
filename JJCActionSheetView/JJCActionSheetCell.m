//
//  JJCActionSheetCell.m
//  HonestHouseProperty
//
//  Created by 苜蓿鬼仙 on 2017/6/30.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//

#import "JJCActionSheetCell.h"


#define K_MainScreen_W          ([UIScreen mainScreen].bounds.size.width)
#define K_MainScreen_H          ([UIScreen mainScreen].bounds.size.height)

#define K_Space_X               10
#define K_Space_Y               10


@interface JJCActionSheetCell ()

@property (nonatomic, weak) UILabel *titleLabel;

@end

@implementation JJCActionSheetCell


+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    NSString *cellID = @"JJCActionSheetCellID";
    JJCActionSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[JJCActionSheetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(K_Space_X, 0, K_MainScreen_W-K_Space_X*2, JJCActionSheetCell_Height)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor darkGrayColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
    }
    return self;
}


/********************  设置数据  *******************/

- (void)setTitleString:(NSString *)titleString {
    
    _titleString = titleString;
    
    
    self.titleLabel.text = titleString;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    
    _textAlignment = textAlignment;
    
    
    self.titleLabel.textAlignment = textAlignment;
}













- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
