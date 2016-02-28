//
//  AMProductTemplateThreeItemCell.m
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import "AMProductTemplateThreeItemCell.h"
#import "UIImageView+AFNetworking.h"

@interface AMProductTemplateThreeItemCell ()
@property (nonatomic, strong) UIImageView *itemImageView;
@property (nonatomic, strong) UILabel *itemLabel;
@property (nonatomic, strong) UIView *bottomGradientView;
@end

@implementation AMProductTemplateThreeItemCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _itemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        _itemImageView.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_itemImageView];
        
    }
    
    return self;
}

- (void)configureWithItem:(AMDealItem *)item {
    [self.itemImageView setImageWithURL:[NSURL URLWithString:item.itemImage]];
}

+ (NSString *)reusedIdentifier {
    return NSStringFromClass([self class]);
}

@end
