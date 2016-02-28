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
@property (weak, nonatomic) IBOutlet UIView *bottomGradientView;

@end

@implementation AMProductTemplateThreeCell

- (void)awakeFromNib {
    [self configureCellView];
}

- (void)configureCellView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width - 2 * 8, _collectionView.height);
    flowLayout.minimumInteritemSpacing = 8;
    flowLayout.minimumLineSpacing = 10;
    
    _collectionView.backgroundColor = [UIColor colorWithRed:229.f / 255.f green:229.f / 255.f blue:247.f / 255.f alpha:1];
    _collectionView.collectionViewLayout = flowLayout;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView setContentOffset:CGPointZero animated:NO];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.bounces = NO;
    _collectionView.pagingEnabled = NO;
    [self.collectionView registerClass:[AMProductTemplateThreeItemCell class] forCellWithReuseIdentifier:[AMProductTemplateThreeItemCell reusedIdentifier]];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width - 2 * 8, _bottomGradientView.height);
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor] CGColor], (id)[[UIColor colorWithWhite:0 alpha:0.8] CGColor], nil];
    [_bottomGradientView.layer insertSublayer:gradient atIndex:0];
    
    _pageControl.enabled = NO;
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
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
    NSInteger itemsCount = [self.datasource numberOfImagesForPTThreeCell:self forRowIndex:self.rowIndex];
    self.pageControl.numberOfPages = itemsCount;

    return itemsCount;
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
