//
//  AMDeal.h
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface AMDeal : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *dealLabel;
@property (nonatomic, readonly, copy) NSString *dealImage;
@property (nonatomic, readonly, copy) NSString *dealTemplate;
@property (nonatomic, readonly, copy) NSArray *dealItems;

@end
