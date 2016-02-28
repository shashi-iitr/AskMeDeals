//
//  AMProductTemplateOneCell.m
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import "AMProductTemplateOneCell.h"
#import "UIImageView+AFNetworking.h"
#import "FrameAccessor.h"

@interface AMProductTemplateOneCell ()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UIView *bottomGradientView;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;

@end

@implementation AMProductTemplateOneCell

- (void)awakeFromNib {
    _itemImageView.contentMode = UIViewContentModeScaleToFill;
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width - 2 * 8, _bottomGradientView.height);
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor] CGColor], (id)[[UIColor colorWithWhite:0 alpha:0.8] CGColor], nil];
    [_bottomGradientView.layer insertSublayer:gradient atIndex:0];

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
