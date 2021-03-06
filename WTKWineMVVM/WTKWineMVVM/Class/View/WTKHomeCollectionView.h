//
//  WTKHomeCollectionView.h
//  WTKWineMVVM
//
//  Created by 王同科 on 16/9/14.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTKHomeViewModel.h"
@interface WTKHomeCollectionView : UICollectionView

@property(nonatomic,strong)NSArray *headArray;

@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,strong)WTKHomeViewModel *viewModel;

@end
