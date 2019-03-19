//
//  DSHorizontalTableViewCtrl.m
//  DSComponents
//
//  Created by cgw on 2019/3/19.
//  Copyright © 2019 bill. All rights reserved.
//

#import "DSHorizontalTableViewCtrl.h"
#import "DSHorizontalTableView.h"

@interface DSHorizontalTableViewCtrl ()<DSHorizontalTableViewDelegate>

@end

@implementation DSHorizontalTableViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    DSHorizontalTableView *htView = [[DSHorizontalTableView alloc] initWithCellClass:[UICollectionViewCell class] cellSize:CGSizeMake(50, 50) contentEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0) interCellSpace:15];
    htView.frame = CGRectMake(0, 100, self.view.frame.size.width, 60);
    htView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    htView.delegate = self;
    [self.view addSubview:htView];

    [htView reloadData];
}

#pragma mark - TableView
- (void)horizontalTableView:(DSHorizontalTableView *)htView setupCell:(UIView *)cell atIndex:(NSInteger)index{
    UILabel *lbl = (UILabel*)cell;
    if( [lbl isKindOfClass:[UILabel class]] ){
        lbl.text = @(index).stringValue;
        lbl.textColor = [UIColor redColor];
    }
    
    lbl.backgroundColor = [UIColor colorWithRed:rand()%255/255.0 green:rand()%255/255.0 blue:rand()%255/255.0 alpha:1];
}

- (NSInteger)numberOfCellsInHorizontalTableView:(DSHorizontalTableView *)htView{
    return 20;
}

@end
