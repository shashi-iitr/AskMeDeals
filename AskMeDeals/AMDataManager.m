//
//  AMDataManager.m
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import "AMDataManager.h"

@implementation AMDataManager

+ (instancetype)sharedManager {
    static AMDataManager *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}

- (void)fetchDealFromLocalFile:(NSString *)fileName success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary *JSONDict = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:nil];

    NSError *error;
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in JSONDict) {
        AMDeal *deal = [MTLJSONAdapter modelOfClass:[AMDeal class] fromJSONDictionary:dict error:&error];
        [array addObject:deal];
    }

    if (success) {
        success([array copy]);
    }
}

@end
