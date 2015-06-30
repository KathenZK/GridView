//
//  ViewController.m
//  GridView
//
//  Created by ZK on 15/6/30.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "ViewController.h"
#import "GridView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    GridView *gridView = [[GridView alloc] initWithFrame:self.view.bounds];
    gridView.gridColor = [UIColor redColor];
    gridView.alpha = 0.6;
    gridView.gridSpacing = 50;
    gridView.gridLineWidth = 5;
    [self.view addSubview:gridView];
}
@end
