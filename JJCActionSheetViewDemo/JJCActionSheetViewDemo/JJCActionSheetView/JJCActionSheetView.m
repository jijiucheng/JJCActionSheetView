//
//  JJCActionSheetView.m
//  HonestHouseProperty
//
//  Created by 苜蓿鬼仙 on 2017/6/30.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//

#import "JJCActionSheetView.h"

#import "JJCActionSheetCell.h"


#define K_MainScreen_W          ([UIScreen mainScreen].bounds.size.width)
#define K_MainScreen_H          ([UIScreen mainScreen].bounds.size.height)

#define K_Space_X               10
#define K_Space_Y               10

#define K_View_BGColor    [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0]  // 基础底色


@interface JJCActionSheetView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) JJCActionSheetViewType type;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArrayM;

@property (nonatomic, assign) CGFloat tableHeight;

@end

@implementation JJCActionSheetView


- (instancetype)initWithFrame:(CGRect)frame ActionSheetViewType:(JJCActionSheetViewType)type {
    
    if (self = [super initWithFrame:CGRectMake(0, 0, K_MainScreen_W, K_MainScreen_H)]) {
        
        self.backgroundColor = [UIColor colorWithWhite:0.2f alpha:0.5f];
        
        
        self.type = type;
        self.tableHeight = 0;
        self.dataArrayM = [NSMutableArray array];
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}


- (void)createUI {
    
    if (self.type == JJCActionSheetViewTypeTitleCancel) {
        self.tableHeight = (self.dataTitleArray.count + 2) * JJCActionSheetCell_Height + K_Space_Y/2*2;
    } else {
        self.tableHeight = (self.dataTitleArray.count + 1) * JJCActionSheetCell_Height + K_Space_Y/2;
    }
    
    
    if (self.dataTitleArray.count >0 && !_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, K_MainScreen_H-self.tableHeight, K_MainScreen_W, self.tableHeight) style:UITableViewStylePlain];
        _tableView.backgroundColor = K_View_BGColor;
        _tableView.dataSource = self;
        _tableView.delegate   = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableHeaderView = [UIView new];
        _tableView.tableFooterView = [UIView new];
        _tableView.rowHeight = JJCActionSheetCell_Height;
        if (self.tableHeight > K_MainScreen_H/2) {
            _tableView.bounces = YES;
        } else {
            _tableView.bounces = NO;
        }
        [self addSubview:_tableView];
        
        
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [_tableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
}


#pragma mark -----
#pragma mark ---------------  UITableViewDataSource、UITableViewDelegate 代理  ---------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArrayM.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataArrayM[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JJCActionSheetCell *cell = [JJCActionSheetCell cellWithTableView:tableView];
    
    cell.titleString   = self.dataArrayM[indexPath.section][indexPath.row];
    cell.textAlignment = self.textAlignment;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.type == JJCActionSheetViewTypeDefault) {
        
        if (indexPath.section == 0) {
            [self hideActionSheetView];
        } else {
            self.block(indexPath.row, self.dataTitleArray[indexPath.row]);
            [self hideActionSheetView];
        }
        
    } else if (self.type == JJCActionSheetViewTypeTitle) {
        
        if (indexPath.section == 1) {
            self.block(indexPath.row, self.dataTitleArray[indexPath.row]);
            [self hideActionSheetView];
        }
        
    } else if (self.type == JJCActionSheetViewTypeCancel) {
        
        if (indexPath.section == 0) {
            self.block(indexPath.row, self.dataTitleArray[indexPath.row]);
        }
        [self hideActionSheetView];
        
    } else if (self.type == JJCActionSheetViewTypeTitleCancel) {
        
        if (indexPath.section == 1) {
            self.block(indexPath.row, self.dataTitleArray[indexPath.row]);
            [self hideActionSheetView];
        } else if (indexPath.section == 2) {
            [self hideActionSheetView];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return 0;
    } else {
        if (self.type == JJCActionSheetViewTypeTitleCancel && section == 2) {
            return 0;
        } else {
            return K_Space_Y/2;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (self.type == JJCActionSheetViewTypeTitleCancel && section == 1) {
        return K_Space_Y/2;
    } else {
        return 0;
    }
}


#pragma mark -----
#pragma mark ---------------  Method  ---------------

- (void)setDataTitleArray:(NSArray *)dataTitleArray {
    
    _dataTitleArray = dataTitleArray;
    
    
    if (self.type == JJCActionSheetViewTypeDefault) {
        self.dataArrayM = [NSMutableArray arrayWithObjects:@[@"默认"], _dataTitleArray, nil];
    } else if (self.type == JJCActionSheetViewTypeTitle) {
        self.dataArrayM = [NSMutableArray arrayWithObjects:@[@"请选择"], _dataTitleArray, nil];
    } else if (self.type == JJCActionSheetViewTypeCancel) {
        self.dataArrayM = [NSMutableArray arrayWithObjects:_dataTitleArray, @[@"取消"], nil];
    } else if (self.type == JJCActionSheetViewTypeTitleCancel) {
        self.dataArrayM = [NSMutableArray arrayWithObjects:@[@"请选择"], _dataTitleArray, @[@"取消"], nil];
    }
    
    
    [self createUI];
}

- (void)setDefaultTitleString:(NSString *)defaultTitleString {
    
    _defaultTitleString = defaultTitleString;
    
    
    if (self.type == JJCActionSheetViewTypeDefault) {
        self.dataArrayM = [NSMutableArray arrayWithObjects:@[defaultTitleString], _dataTitleArray, nil];
    } else if (self.type == JJCActionSheetViewTypeTitle) {
        self.dataArrayM = [NSMutableArray arrayWithObjects:@[defaultTitleString], _dataTitleArray, nil];
    } else if (self.type == JJCActionSheetViewTypeCancel) {
        self.dataArrayM = [NSMutableArray arrayWithObjects:_dataTitleArray, @[@"取消"], nil];
    } else if (self.type == JJCActionSheetViewTypeTitleCancel) {
        self.dataArrayM = [NSMutableArray arrayWithObjects:@[defaultTitleString], _dataTitleArray, @[@"取消"], nil];
    }
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    
    _textAlignment = textAlignment;
}



/********************  Animation  *******************/

- (void)showActionSheetView {
    
    if (self.dataTitleArray.count > 0) {
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
        
        
        CGRect tempFrame = self.tableView.frame;
        self.alpha = 0.0f;
        self.tableView.frame = CGRectMake(0, K_MainScreen_H, K_MainScreen_W, 0);
        [UIView animateWithDuration:0.25f animations:^{
            self.alpha = 1.0f;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25f animations:^{
                self.tableView.frame = tempFrame;
            }];
        }];
    }
}

- (void)hideActionSheetView {
    
    [UIView animateWithDuration:0.25f animations:^{
        self.tableView.frame = CGRectMake(0, K_MainScreen_H, K_MainScreen_W, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.25f animations:^{
                self.alpha = 0.0f;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
    }];
}





@end






