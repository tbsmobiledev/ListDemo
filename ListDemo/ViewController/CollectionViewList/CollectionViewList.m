//
//  CollectionViewList.m
//  ListDemo
//
//  Created by TBS02 on 15/10/19.
//  Copyright © 2019 Sazzadhusen Iproliya. All rights reserved.
//

#import "CollectionViewList.h"

@implementation cellCollectionList
@synthesize lblName,lblDescription,imgDisplay;
@end

@interface CollectionViewList ()

@end

@implementation CollectionViewList
@synthesize collectList;

- (void)viewDidLoad {
    [super viewDidLoad];

    arrData = [NSMutableArray new];
    NSString * filepath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"txt"];
    NSError *error;
    NSString * fileContents = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];
    if (error){
        NSLog(@"Error in reading file: %@", error.localizedDescription);
    }
    NSArray *arrDataTemp = [fileContents componentsSeparatedByString:@"\n"];
    
    for (int i = 0; i<arrDataTemp.count ; i++ ) {
        NSArray* columns = [arrDataTemp[i] componentsSeparatedByString:@","];
        if (columns.count > 1){
            CountryModel * countryObj = [CountryModel new];
            countryObj.countryId = columns[0];
            countryObj.name = columns[1];
            countryObj.descreption = columns[2];
            countryObj.image = columns[3];
            [arrData addObject:countryObj];
        }
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    cellCollectionList *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellCollectionList" forIndexPath:indexPath];
    
    countryModelObj = [arrData objectAtIndex:indexPath.row];
    cell.imgDisplay.image = [UIImage imageNamed:countryModelObj.image];
    cell.lblName.text = countryModelObj.name;
    cell.lblDescription.text = countryModelObj.descreption;

    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [arrData count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 6) {
        return CGSizeMake([[UIScreen mainScreen] bounds].size.width - 15, [[UIScreen mainScreen] bounds].size.width / 2);
    }
    return CGSizeMake(([[UIScreen mainScreen] bounds].size.width/2) - 15, [[UIScreen mainScreen] bounds].size.width / 2);
}

@end
