//
//  DSHorizontalTableView.m
//  DSComponents
//
//  Created by cgw on 2019/3/19.
//  Copyright © 2019 bill. All rights reserved.
//

#import "DSHorizontalTableView.h"
#import "DSHorizontalTableLayout.h"

@interface DSHorizontalTableView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, assign) UIEdgeInsets contentEdgeInsets;
@property (nonatomic, assign) CGFloat interCellSpace;  //cell的间隙
@property (nonatomic, assign) CGSize cellSize;
@end

@interface abccell : UICollectionViewCell

@end

@implementation abccell



@end

@implementation DSHorizontalTableView{
    NSString *_cellReuseIdentify;
    Class _cellClass;
}

- (id)initWithCellClass:(Class)cellClass cellSize:(CGSize)cellSize contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets interCellSpace:(CGFloat)interCellSpace{
    self = [super init];
    if( self ){

        _cellClass = cellClass;
        _contentEdgeInsets = contentEdgeInsets;
        _interCellSpace = interCellSpace;
        _cellSize = cellSize;
        
        _contentEdgeInsets.top = 0;
        _contentEdgeInsets.bottom = 0;
        
        
        _cellReuseIdentify = [NSString stringWithFormat:@"cellreuseid%d",rand()%100000+100];
        
        [self.collectionView registerClass:[abccell class] forCellWithReuseIdentifier:_cellReuseIdentify];
    }
    return self;
}

- (void)reloadData{
    [self.collectionView reloadData];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.collectionView.frame = self.bounds;
}

#pragma mark - UICollectionViewLayout
-  (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return _contentEdgeInsets;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return _cellSize;
}

#pragma mark - CollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if( _delegate && [_delegate respondsToSelector:@selector(numberOfCellsInHorizontalTableView:)] ){
        return [_delegate numberOfCellsInHorizontalTableView:self];
    }
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cellReuseIdentify forIndexPath:indexPath];
    
    if( _delegate && [_delegate respondsToSelector:@selector(horizontalTableView:setupCell:atIndex:)] ){
        [_delegate horizontalTableView:self setupCell:cell atIndex:indexPath.row];
    }
    
    return cell;
}

#pragma mark - Getter
- (UICollectionView*)collectionView {
    if( !_collectionView ){
        UICollectionViewFlowLayout *layout =
        [[DSHorizontalTableLayout alloc] initWithInterCellSpace:_interCellSpace];
        layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 0);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        
        [self addSubview:_collectionView];
    }
    
    return _collectionView;
}

@end
