//
//  JJCActionSheetView.h
//  HonestHouseProperty
//
//  Created by 苜蓿鬼仙 on 2017/6/30.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//





/*
 
 自定义封装底部 ActionSheetView_v0.0.3
 2017.06.30
 
 */




#import <UIKit/UIKit.h>



typedef NS_ENUM(NSInteger, JJCActionSheetViewType) {
    JJCActionSheetViewTypeDefault = 0,      // 默认类型：无标题、无取消；有默认选项
    JJCActionSheetViewTypeTitle,            // 标题类型：无默认选项、无取消；有标题
    JJCActionSheetViewTypeCancel,           // 取消类型：无默认选项、无标题；有取消
    JJCActionSheetViewTypeTitleCancel       // 标题取消类型：无默认选项；有标题，有取消
};


typedef void(^JJCActionSheetViewSelectBlock)(NSInteger index, NSString *indexName);


@interface JJCActionSheetView : UIView


@property (nonatomic, strong) NSArray *dataTitleArray;
@property (nonatomic, copy)   NSString *defaultTitleString;     // 默认选项文字；标题文字
@property (nonatomic, assign) NSTextAlignment textAlignment;    // 设置文字居中样式
@property (nonatomic, copy)   JJCActionSheetViewSelectBlock block;


- (instancetype)initWithFrame:(CGRect)frame ActionSheetViewType:(JJCActionSheetViewType)type;


- (void)showActionSheetView;
- (void)hideActionSheetView;


@end
