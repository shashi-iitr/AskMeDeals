//
//  AMProductTemplateThreeCell.m
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import "AMProductTemplateThreeCell.h"
#import "AMProductTemplateThreeItemCell.h"
#import "FrameAccessor.h"

@interface AMProductTemplateThreeCell () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation AMProductTemplateThreeCell

- (void)awakeFromNib {
    [self configureCellView];
}

- (void)configureCellView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = self.bounds.size;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    _collectionView.backgroundColor = [UIColor colorWithRed:229.f / 255.f green:229.f / 255.f blue:247.f / 255.f alpha:1];
    _collectionView.collectionViewLayout = flowLayout;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView setContentOffset:CGPointZero animated:NO];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.bounces = NO;
    _collectionView.pagingEnabled = YES;
    [self.collectionView registerClass:[AMProductTemplateThreeItemCell class] forCellWithReuseIdentifier:[AMProductTemplateThreeItemCell reusedIdentifier]];
}

- (void)reloadCell {
    [self.collectionView reloadData];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.collectionView.width;
    float fractionalPage = self.collectionView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.datasource numberOfImagesForPTThreeCell:self forRowIndex:self.rowIndex];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AMProductTemplateThreeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[AMProductTemplateThreeItemCell reusedIdentifier] forIndexPath:indexPath];
    [cell configureWithItem:[self.datasource ptThreeCell:self infoForItemAtIndex:indexPath.item forRowIndex:self.rowIndex]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate ptThreeCell:self didSelectItemAtIndex:indexPath.item forRowIndex:self.rowIndex];
}

+ (NSString *)reusedIdentifier {
    return NSStringFromClass([self class]);
}


#pragma mark - Lazy Initializers

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
