//
//  CICRootViewController.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/12.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "CICRootViewController.h"

#import "CICDemoViewController.h"
#import "UIColor+CIComponentKit.h"
#import "CICLabel.h"
#import "CICHUD.h"
#import <CICTabBarController.h>

@interface CICRootViewController ()

@end

@implementation CICRootViewController

#pragma mark - Life Cycles
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isHiddenNavigationBar = YES;
    
//    CICColorBox color = {211, 121, 124, 0.8};
//    self.view.backgroundColor = [UIColor cic_srgbColorWithBox: color];
    self.view.backgroundColor = CICColorMake(211, 121, 124, 0.8);
    
    [self.view addSubview:({
        CICLabel *label = [CICLabel new];
        label.cic
        .text(@"😄Welcome to CIComponent😄")
        .textColor([UIColor blackColor])
        .frame(CGRectMake(0, 164, self.view.bounds.size.width, 44))
        .textAlignment(NSTextAlignmentCenter)
        .backgroundColor([UIColor cic_p3RandomColor])
        .contentEdgeInset(UIEdgeInsetsMake(0, 10, 0, -10))
        .copyRange(NSMakeRange(0, 10))
        .longPress(CICLabelLongPressCopy)
        .highlightedBackgroundColor([UIColor cic_p3RandomColor]);
        label;
    })];
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"你开心就好"];
    [[CICHUD share] toasWithTitle:str];
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesBegan:touches withEvent:event];
//    CICDemoViewController *vc = [CICDemoViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
//}

@end
