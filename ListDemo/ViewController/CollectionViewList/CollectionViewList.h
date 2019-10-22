//
//  CollectionViewList.h
//  ListDemo
//
//  Created by TBS02 on 15/10/19.
//  Copyright © 2019 Sazzadhusen Iproliya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryModel.h"

@interface cellCollectionList : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
@property (strong, nonatomic) IBOutlet UIImageView *imgDisplay;

@end


@interface CollectionViewList : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    CountryModel *countryModelObj;
    NSMutableArray *arrData;

}
@property (strong, nonatomic) IBOutlet UICollectionView *collectList;

@end




