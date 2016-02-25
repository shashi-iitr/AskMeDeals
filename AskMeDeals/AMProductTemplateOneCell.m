//
//  AMProductTemplateOneCell.m
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import "AMProductTemplateOneCell.h"
#import "UIImageView+AFNetworking.h"

@interface AMProductTemplateOneCell ()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UIView *bottomGradientView;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;

@end

@implementation AMProductTemplateOneCell

- (void)awakeFromNib {
    _itemImageView.contentMode = UIViewContentModeScaleToFill;
}

- (void)configureWithItem:(AMDealItem *)item {
    self.itemLabel.text = [item.itemLabel capitalizedString];
    [self.itemImageView setImageWithURL:[NSURL URLWithString:item.itemImage]];
}

+ (NSString *)reusedIdentifier {
    return NSStringFromClass([self class]);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
