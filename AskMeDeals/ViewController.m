//
//  ViewController.m
//  AskMeDeals
//
//  Created by shashi kumar on 25/02/16.
//  Copyright © 2016 Shashi. All rights reserved.
//

#import "ViewController.h"
#import "AMDataManager.h"
#import "AMProductTemplateOneCell.h"
#import "AMProductTemplateTwoCell.h"
#import "AMProductTemplateThreeCell.h"
#import "FrameAccessor.h"

typedef NS_ENUM(NSInteger, AMProductTemplateType) {
    AMProductTemplateTypeOne,
    AMProductTemplateTypeTwo,
    AMProductTemplateTypeThree
};

static NSString *kProductTemplateOne = @"product-template-1";
static NSString *kProductTemplateTwo = @"product-template-2";
static NSString *kProductTemplateThree = @"product-template-3";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, AMProductTemplateTwoCellDelegate, AMProductTemplateTwoCellDataSource, AMProductTemplateThreeCellDataSource, AMProductTemplateThreeCellDelegate>
@property (nonatomic, strong) NSMutableArray *deals;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic) BOOL isAllDataFetched;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self fetchDealsForFile:@"f_one"];
}

- (void)fetchDealsForFile:(NSString *)fileName {
    typeof(self) __weak weakself = self;
    [[AMDataManager sharedManager] fetchDealFromLocalFile:fileName success:^(NSArray *deals) {
        [weakself.deals addObjectsFromArray:deals];
        NSLog(@"deals %@", deals);
        if (weakself.deals.count) {
            if (deals.count > 0) {
                weakself.isAllDataFetched = YES;
                NSInteger previousIndex = weakself.deals.count;
                NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
                [weakself.deals addObjectsFromArray:deals];
                for (NSInteger i = previousIndex; i < weakself.deals.count; i++) {
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:i];
                    [indexPaths addObject:indexPath];
                }
                
                [weakself.tableView beginUpdates];
                [weakself.tableView insertRowsAtIndexPaths:[indexPaths copy] withRowAnimation:UITableViewRowAnimationNone];
                [weakself.tableView endUpdates];
            }
        } else {
            weakself.isAllDataFetched = NO;
            [weakself.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - AMProductTemplateThreeCellDataSource, AMProductTemplateThreeCellDelegate

- (NSUInteger)numberOfImagesForPTThreeCell:(AMProductTemplateThreeCell *)cell forRowIndex:(NSInteger)rowIndex {
    AMDeal *deal = self.deals[rowIndex];
    
    return deal.dealItems.count;
}

- (AMDealItem *)ptThreeCell:(AMProductTemplateThreeCell *)cell infoForItemAtIndex:(NSUInteger)index forRowIndex:(NSInteger)rowIndex {
    AMDeal *deal = self.deals[rowIndex];
    
    return deal.dealItems[index];
}

- (void)ptThreeCell:(AMProductTemplateThreeCell *)cell didSelectItemAtIndex:(NSUInteger)index forRowIndex:(NSInteger)rowIndex {
    AMDeal *deal = self.deals[rowIndex];
    
    NSLog(@"deal Item %@", deal.dealItems[index]);
}

#pragma mark - AMProductTemplateTwoCellDelegate, AMProductTemplateTwoCellDataSource

- (NSUInteger)numberOfImagesForPTTwoCell:(AMProductTemplateTwoCell *)cell forRowIndex:(NSInteger)rowIndex {
    AMDeal *deal = self.deals[rowIndex];
    
    return deal.dealItems.count;
}

- (AMDealItem *)ptTwoCell:(AMProductTemplateTwoCell *)cell infoForItemAtIndex:(NSUInteger)index forRowIndex:(NSInteger)rowIndex {
    AMDeal *deal = self.deals[rowIndex];
    
    return deal.dealItems[index];
}

- (void)ptTwoCell:(AMProductTemplateTwoCell *)cell didSelectImageAtIndex:(NSUInteger)index forRowIndex:(NSInteger)rowIndex {
    AMDeal *deal = self.deals[rowIndex];
    
    NSLog(@"deal Item %@", deal.dealItems[index]);
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.deals.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AMDeal *deal = self.deals[indexPath.section];
    
    if ([deal.dealTemplate isEqualToString:kProductTemplateOne]) {
        AMProductTemplateOneCell *cell = [tableView dequeueReusableCellWithIdentifier:[AMProductTemplateOneCell reusedIdentifier] forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell configureWithItem:[deal.dealItems firstObject]];
        
        return cell;
    } else if ([deal.dealTemplate isEqualToString:kProductTemplateTwo]) {
        AMProductTemplateTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:[AMProductTemplateTwoCell reusedIdentifier] forIndexPath:indexPath];
        cell.delegate = self;
        cell.dataSource = self;
        cell.rowIndex = indexPath.section;
        [cell reloadCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    } else if ([deal.dealTemplate isEqualToString:kProductTemplateThree]) {
        AMProductTemplateThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:[AMProductTemplateThreeCell reusedIdentifier] forIndexPath:indexPath];
        cell.delegate = self;
        cell.datasource = self;
        cell.rowIndex = indexPath.section;
        [cell reloadCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 30)];
    view.backgroundColor = [UIColor colorWithRed:229.f / 255.f green:229.f / 255.f blue:247.f / 255.f alpha:1];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, 10, view.width - 2 * 8, 20.f)];
    label.textColor = [UIColor colorWithRed:66.f/255.f green:171.f/255.f blue:231.f/255.f alpha:1];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:12.f];
    
    AMDeal *deal = self.deals[section];
    
    label.text = deal.dealLabel;
    [view addSubview:label];
    
    return view;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.deals.count > 0) {
        if (indexPath.row == self.deals.count - 2 && !self.isAllDataFetched) {
            [self fetchDealsForFile:@"f_two"];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Lazy Initializers

- (NSMutableArray *)deals {
    if (!_deals) {
        _deals = [[NSMutableArray alloc] init];
    }
    
    return _deals;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 44.f;
        _tableView.backgroundColor = [UIColor colorWithRed:229.f / 255.f green:229.f / 255.f blue:247.f / 255.f alpha:1];
        [_tableView registerNib:[UINib nibWithNibName:@"AMProductTemplateOneCell" bundle:nil] forCellReuseIdentifier:[AMProductTemplateOneCell reusedIdentifier]];
        [_tableView registerNib:[UINib nibWithNibName:@"AMProductTemplateTwoCell" bundle:nil] forCellReuseIdentifier:[AMProductTemplateTwoCell reusedIdentifier]];
        [_tableView registerNib:[UINib nibWithNibName:@"AMProductTemplateThreeCell" bundle:nil] forCellReuseIdentifier:[AMProductTemplateThreeCell reusedIdentifier]];


    }
    
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
