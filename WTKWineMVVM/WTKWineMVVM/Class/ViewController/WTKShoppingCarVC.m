//
//  WTKShoppingCarVC.m
//  WTKWineMVVM
//
//  Created by 王同科 on 16/9/22.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import "WTKShoppingCarVC.h"

@interface WTKShoppingCarVC ()

@end

@implementation WTKShoppingCarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//        [RACObserve([WTKUser currentUser], bageValue) subscribeNext:^(id x) {
//
//            NSInteger num = [x integerValue];
//            if (num <= 0)
//            {
//                self.tabBarItem.badgeValue = nil;
//            }
//            else
//            {
//                self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",num];
//            }
//        }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
