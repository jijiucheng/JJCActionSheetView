//
//  JJCActionSheetCell.h
//  HonestHouseProperty
//
//  Created by 苜蓿鬼仙 on 2017/6/30.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//

#import <UIKit/UIKit.h>



#define JJCActionSheetCell_Height  44


@interface JJCActionSheetCell : UITableViewCell


@property (nonatomic, copy)   NSString        *titleString;
@property (nonatomic, assign) NSTextAlignment  textAlignment;


+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
