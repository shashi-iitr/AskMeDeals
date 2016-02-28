//
//  AMProductTemplateTwoCell.h
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMDealItem.h"

@class AMProductTemplateTwoCell;

@protocol AMProductTemplateTwoCellDelegate <NSObject>

- (void)ptTwoCell:(AMProductTemplateTwoCell *)cell didSelectImageAtIndex:(NSUInteger)index forRowIndex:(NSInteger)rowIndex;

@end

@protocol AMProductTemplateTwoCellDataSource <NSObject>

- (NSUInteger)numberOfImagesForPTTwoCell:(AMProductTemplateTwoCell *)cell forRowIndex:(NSInteger)rowIndex;
- (AMDealItem *)ptTwoCell:(AMProductTemplateTwoCell *)cell infoForItemAtIndex:(NSUInteger)index forRowIndex:(NSInteger)rowIndex;

@end

@interface AMProductTemplateTwoCell : UITableViewCell

+ (NSString *)reusedIdentifier;

@property (nonatomic, weak) id<AMProductTemplateTwoCellDataSource>dataSource;
@property (nonatomic, weak) id<AMProductTemplateTwoCellDelegate>delegate;
@property (nonatomic, assign) NSInteger rowIndex;

- (void)reloadCell;

@end
