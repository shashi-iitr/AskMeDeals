//
//  AMProductTemplateTwoItemCell.m
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import "AMProductTemplateTwoItemCell.h"
#import "FrameAccessor.h"
#import "UIImageView+AFNetworking.h"

@interface AMProductTemplateTwoItemCell ()
@property (nonatomic, strong) UIImageView *itemImageView;
@property (nonatomic, strong) UILabel *itemLabel;
@end

@implementation AMProductTemplateTwoItemCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _itemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 95, 95)];
        _itemImageView.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_itemImageView];
        
        _itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, _itemImageView.bottom, _itemImageView.width - 2 * 8, CGRectGetHeight(frame) - 95)];
        _itemLabel.font = [UIFont systemFontOfSize:12.f];
        _itemLabel.backgroundColor = [UIColor whiteColor];
        _itemLabel.numberOfLines = 0;
        [self.contentView addSubview:_itemLabel];
    }
    
    return self;
}

- (void)configureWithItem:(AMDealItem *)item {
    self.itemLabel.text = [item.itemLabel capitalizedString];
    [self.itemImageView setImageWithURL:[NSURL URLWithString:item.itemImage]];
}

+ (NSString *)reusedIdentifier {
    return NSStringFromClass([self class]);
}

@end
