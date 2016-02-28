//
//  AMDataManager.h
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMDeal.h"

@interface AMDataManager : NSObject

+ (instancetype)sharedManager;

- (void)fetchDealFromLocalFile:(NSString *)fileName success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure;

@end
