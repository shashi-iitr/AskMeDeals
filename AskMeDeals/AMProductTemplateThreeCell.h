//
//  AMProductTemplateThreeCell.h
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMDealItem.h"

@class AMProductTemplateThreeCell;

@protocol AMProductTemplateThreeCellDelegate <NSObject>

- (void)ptThreeCell:(AMProductTemplateThreeCell *)cell didSelectItemAtIndex:(NSUInteger)index forRowIndex:(NSInteger)rowIndex;

@end

@protocol AMProductTemplateThreeCellDataSource <NSObject>

- (NSUInteger)numberOfImagesForPTThreeCell:(AMProductTemplateThreeCell *)cell forRowIndex:(NSInteger)rowIndex;
- (AMDealItem *)ptThreeCell:(AMProductTemplateThreeCell *)cell infoForItemAtIndex:(NSUInteger)index forRowIndex:(NSInteger)rowIndex;

@end

@interface AMProductTemplateThreeCell : UITableViewCell

+ (NSString *)reusedIdentifier;

@property (nonatomic, weak) id<AMProductTemplateThreeCellDataSource>datasource;
@property (nonatomic, weak) id<AMProductTemplateThreeCellDelegate>delegate;

@property (nonatomic, assign) NSInteger rowIndex;

- (void)reloadCell;

@end
