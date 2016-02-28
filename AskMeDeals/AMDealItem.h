//
//  AMDealItem.h
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface AMDealItem : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *itemLabel;
@property (nonatomic, readonly, copy) NSString *itemImage;
@property (nonatomic, readonly, copy) NSString *itemWebURL;;

@end
