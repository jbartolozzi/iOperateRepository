//
//  AdvancedCollectionViewViewController.h
//  iOperate
//
//  Created by James Bartolozzi on 5/28/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdvancedCell.h"

@interface AdvancedCollectionViewViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
