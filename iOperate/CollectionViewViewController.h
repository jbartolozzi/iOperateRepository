//
//  CollectionViewViewController.h
//  iOperate
//
//  Created by Max Gilbert on 5/22/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;



@end
