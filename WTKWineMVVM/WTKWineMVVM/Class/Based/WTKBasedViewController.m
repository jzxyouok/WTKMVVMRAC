//
//  WTKBasedViewController.m
//  WTKWineMVVM
//
//  Created by 王同科 on 16/9/14.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import "WTKBasedViewController.h"

@interface WTKBasedViewController ()<UIGestureRecognizerDelegate>
@property(nonatomic,strong,readwrite)WTKBasedViewModel *viewModel;
@property(nonatomic,strong,readwrite)UIPercentDrivenInteractiveTransition *interactivePopTransition;
@end

@implementation WTKBasedViewController

- (instancetype)initWithViewModel:(WTKBasedViewModel *)viewModel
{
    if (self == [super init])
    {
        self.viewModel = viewModel;
//        [self bindViewModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor   = WTKCOLOR(240, 240, 240, 1);
    
    self.viewModel.naviImpl             = [[WTKViewModelNavigationImpl alloc]initWithNavigationController:self.navigationController];
    if (self.navigationController && self != self.navigationController.viewControllers.firstObject)
    {
        [self resetNaviWithTitle:@""];
        UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePopRecognizer:)];
        [self.view addGestureRecognizer:popRecognizer];
        popRecognizer.delegate = self;
    }
}

- (void)bindViewModel
{
    RAC(self.navigationItem,title)     = RACObserve(self.viewModel, title);
}


- (void)resetNaviWithTitle:(NSString *)title
{
//    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClick)];
//    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
//    self.navigationItem.backBarButtonItem = btn;
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"backbutton"] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(0, 0, 20, 20);
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
}

- (void)handlePopRecognizer:(UIPanGestureRecognizer *)recognizer
{
    CGFloat progress = [recognizer translationInView:self.view].x / CGRectGetWidth(self.view.frame);
    progress = MIN(1.0, MAX(0.0, progress));
    NSLog(@"progress---%.2f",progress);
    if (progress <= 0) {
        return;
    }
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc]init];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        [self.interactivePopTransition updateInteractiveTransition:progress];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled)
    {
        if (progress > 0.25)
        {
            [self.interactivePopTransition finishInteractiveTransition];
        }
        else
        {
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        self.interactivePopTransition = nil;
    }
}


- (void)leftBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
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
