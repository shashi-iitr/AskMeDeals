//
//  AMDeal.m
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import "AMDeal.h"
#import "AMDealItem.h"

//"label": "Dealoftheday",
//
//"image": "http://media.askmebazaar.com/media/catalog/product/a/n/ankita-30-april-50.jpeg",
//
//"template": "product-template-2",
//
//"items": []

@implementation AMDeal

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"dealLabel"       : @"label",
             @"dealImage"       : @"image",
             @"dealTemplate"    : @"template",
             @"dealItems"       : @"items"};
}

+ (NSValueTransformer *)dealItemsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[AMDealItem class]];
}

@end
