//
//  AMDealItem.m
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import "AMDealItem.h"

//"label": "Myawesomedeal",
//
//"image": "http://media.askmebazaar.com/media/catalog/product/thumbnails/150x150/6/c/6curtain.jpeg",
//
//"web-url": "http://www.askmebazaar.com/product.php?product_id=818256&utm_source=web&utm_medium=homepage&utm_campaign=Campaign"

@implementation AMDealItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"itemLabel"   : @"label",
             @"itemImage"   : @"image",
             @"itemWebURL"  : @"web-url"};
}

@end
