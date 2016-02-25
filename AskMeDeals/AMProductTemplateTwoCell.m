//
//  AMProductTemplateTwoCell.m
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import "AMProductTemplateTwoCell.h"
#import "AMProductTemplateTwoItemCell.h"

@interface AMProductTemplateTwoCell () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation AMProductTemplateTwoCell

- (void)awakeFromNib {
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor colorWithRed:229.f / 255.f green:229.f / 255.f blue:247.f / 255.f alpha:1];
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[AMProductTemplateTwoItemCell class] forCellWithReuseIdentifier:[AMProductTemplateTwoItemCell reusedIdentifier]];
}

- (void)reloadCell {
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource numberOfImagesForPTTwoCell:self forRowIndex:self.rowIndex];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AMProductTemplateTwoItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[AMProductTemplateTwoItemCell reusedIdentifier] forIndexPath:indexPath];
    [cell configureWithItem:[self.dataSource ptTwoCell:self infoForItemAtIndex:indexPath.item forRowIndex:self.rowIndex]];
//    cell.layer.masksToBounds = YES;
//    cell.layer.cornerRadius = 3;
//    cell.layer.borderColor = [UIColor colorWithRed:222.f / 255.f green:222.f / 255.f blue:222.f / 255.f alpha:1].CGColor;
//    cell.layer.borderWidth = 1;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate ptTwoCell:self didSelectImageAtIndex:indexPath.item forRowIndex:self.rowIndex];
}

+ (NSString *)reusedIdentifier {
    return NSStringFromClass([self class]);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
