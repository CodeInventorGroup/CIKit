//
//  CICAppDelegate.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/12.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "CICAppDelegate.h"
#import "CICTabbarController.h"
#import "UIColor+CIComponentKit.h"

@interface CICAppDelegate ()

@end

@implementation CICAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self showTabbarController];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - Private Methods
- (void)showTabbarController {
    
    CICTabbarController *tabbarController = [[CICTabbarController alloc] init];
    
    NSMutableArray *tabBarItemData = [NSMutableArray array];
    CICTabBarItem *homeTabBarItem = [[CICTabBarItem alloc] init];
    homeTabBarItem.cic
    .title(@"首页")
    .normalImage(@"home_tabbar_icon")
    .controllerClassName(@"CICRootViewController")
    .isShowTitle(NO);
    [tabBarItemData addObject:homeTabBarItem];
        
    CICTabBarItem *classifyTabBarItem = [[CICTabBarItem alloc] init];
    classifyTabBarItem.cic
    .title(@"畅聊")
    .normalImage(@"message")
    .controllerClassName(@"CICSecondViewController");
    [tabBarItemData addObject:classifyTabBarItem];
    
    CICTabBarItem *thirdTabBarItem = [[CICTabBarItem alloc] init];
    thirdTabBarItem.cic
    .title(@"工具")
    .normalImageSize(CGSizeMake(30, 30))
    .selectedImageSize(CGSizeMake(20, 20))
    .normalImage(@"tool_tabbar_icon")
    .controllerClassName(@"CICThirdViewController");
    [tabBarItemData addObject:thirdTabBarItem];
    
    tabbarController.cic
    .titleImageMiddleMargin(5)
    .normalImageSize(CGSizeMake(30, 30))
    .tabBarItemData(tabBarItemData)
//    .selectedTitleColor([UIColor cic_hexColor:0x1296db])
    .normalTitleColor([UIColor cic_hexColor:0x646464])
    .selectedTitleColor([UIColor systemPurpleColor])
    .didSelectViewControllerBlock(^(NSInteger index) {
        NSLog(@"selectedIndex = %ld", index);
    });
    
    self.window.rootViewController = tabbarController;
    tabbarController.cic.badgeValue(2, @"100");
    
    //  动态加载tabbar图片的数据
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        classifyTabBarItem.cic.isShowTitleWhenSelected(NO);
        tabbarController.cic.updateBarItemData(classifyTabBarItem, 1)
        .normalImageSize(CGSizeMake(28, 28));
    });
}

@end
