//
//  TableViewList.m
//  ListDemo
//
//  Created by TBS02 on 15/10/19.
//  Copyright © 2019 Sazzadhusen Iproliya. All rights reserved.
//

#import "TableViewList.h"

@implementation cellTableList
@synthesize lblName,lblDescription,imgDisplay;
@end

@interface TableViewList ()

@end

@implementation TableViewList
@synthesize tblList;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrData = [NSMutableArray new];
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"CountryData" ofType:@"plist"];
    NSArray * arrDataTemp = [[NSArray alloc] initWithContentsOfFile:plistPath];
    [arrDataTemp enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
        CountryModel * countryObj = [CountryModel new];
        countryObj.countryId = [obj valueForKey:@"id"];
        countryObj.name = [obj valueForKey:@"title"];
        countryObj.descreption = [obj valueForKey:@"desc"];
        countryObj.image = [obj valueForKey:@"image"];
        [self->arrData addObject:countryObj];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    cellTableList *cell = [tableView dequeueReusableCellWithIdentifier:@"cellTableList" forIndexPath:indexPath];
    
    countryModelObj = [arrData objectAtIndex:indexPath.row];
    cell.imgDisplay.image = [UIImage imageNamed:countryModelObj.image];
    cell.lblName.text = countryModelObj.name;
    cell.lblDescription.text = countryModelObj.descreption;
    
    return cell;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end
