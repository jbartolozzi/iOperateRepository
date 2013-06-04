//
//  PhotoViewerViewController.h
//  iOperate
//
//  Created by Max Gilbert on 5/17/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "QuartzCore/CALayer.h"
#import <MediaPlayer/MediaPlayer.h>
#import "CustomCell.h"

@interface PhotoViewerViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *fullScreenCollection;


@end
