//
//  DRToastView.m
//  Records
//
//  Created by admin on 2018/6/6.
//  Copyright © 2018年 DuoRong Technology Co., Ltd. All rights reserved.
//

#import "DRToastView.h"
#import <JXExtension/JXExtension.h>
#import <DRMacroDefines/DRMacroDefines.h>

@interface DRToastView (){
    
}

@property (weak, nonatomic) IBOutlet JXAlertContainerView *containerView;
@property (nonatomic, copy) DRToastViewCompleteBlock completeBlock;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerY;

@end

@implementation DRToastView

+ (void)showWithMessage:(NSString *)message complete:(DRToastViewCompleteBlock)complete{
    [self showWithMessage:message upOffset:0 complete:complete];
}

+ (void)showWithMessage:(NSString *)message
               upOffset:(CGFloat)upOffset
               complete:(DRToastViewCompleteBlock)complete {
    DRToastView *alertView = kDR_LOAD_XIB_NAMED(NSStringFromClass([self class]));
    alertView.frame = [UIScreen mainScreen].bounds;
    alertView.messageLabel.text = message;
    alertView.centerY.constant = -upOffset;
    alertView.messageLabel.preferredMaxLayoutWidth = 230;
    alertView.completeBlock = complete;
    [alertView show];
    [kDRWindow addSubview:alertView];
}

#pragma mark - Private Method
- (void)show {
    [UIView animateWithDuration:kDRAnimationDuration animations:^{
        self.layer.opacity = .95;
    }];
    [self.containerView popToShow];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismiss];
    });
}

- (void)dismiss {
    [UIView animateWithDuration:kDRAnimationDuration animations:^{
        self.layer.opacity = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        kDR_SAFE_BLOCK(self.completeBlock, YES);
    }];
    [self.containerView popToDismiss];
}

@end
