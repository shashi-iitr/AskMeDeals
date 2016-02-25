//
//  AMProductTemplateThreeItemCell.h
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMDealItem.h"

@interface AMProductTemplateThreeItemCell : UICollectionViewCell

+ (NSString *)reusedIdentifier;

- (void)configureWithItem:(AMDealItem *)item;

@end
