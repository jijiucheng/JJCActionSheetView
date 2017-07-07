//
//  ViewController.m
//  JJCActionSheetViewDemo
//
//  Created by 苜蓿鬼仙 on 2017/7/7.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//

#import "ViewController.h"

#import "JJCActionSheetView.h"


#define K_MainScreen_W          ([UIScreen mainScreen].bounds.size.width)


@interface ViewController ()

@property (nonatomic, strong) UIButton *counterBtn;
@property (nonatomic, strong) JJCActionSheetView *actionSheetView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self counterBtn];
}


- (UIButton *)counterBtn {
    if (!_counterBtn) {
        
        _counterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _counterBtn.frame = CGRectMake(K_MainScreen_W/4, 300, K_MainScreen_W/2, 40);
        _counterBtn.backgroundColor = [UIColor redColor];
        [_counterBtn setTitle:@"点击" forState:UIControlStateNormal];
        [_counterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _counterBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _counterBtn.adjustsImageWhenHighlighted = NO;
        _counterBtn.layer.cornerRadius = 5;
        _counterBtn.layer.masksToBounds = YES;
        [_counterBtn addTarget:self action:@selector(counterBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_counterBtn];
    }
    return _counterBtn;
}


- (void)counterBtnAction:(UIButton *)button {
    
    if (_actionSheetView) {
        _actionSheetView = nil;
    }
    
    [self actionSheetView];
}


- (JJCActionSheetView *)actionSheetView {
    
    if (!_actionSheetView) {
        
        _actionSheetView = [[JJCActionSheetView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.width-200, [UIScreen mainScreen].bounds.size.width, 200) ActionSheetViewType:JJCActionSheetViewTypeTitleCancel];
        _actionSheetView.dataTitleArray = @[@"标题1", @"标题2", @"标题3"];
        _actionSheetView.defaultTitleString = @"请选择名称";
        
        _actionSheetView.block = ^(NSInteger index, NSString *indexName) {
            NSLog(@"点击了 ----- %zd, %@", index, indexName);
        };
        
        [_actionSheetView showActionSheetView];
    }
    return _actionSheetView;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
