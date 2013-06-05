//
//  EvaluationViewController.m
//  iOperate
//
//  Created by Max Gilbert on 6/5/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "EvaluationViewController.h"

@interface EvaluationViewController (){
    NSMutableArray *arrayOfText;
}

@end

@implementation EvaluationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self evaluationCollection]setDataSource:self];
    [[self evaluationCollection]setDelegate:self];
    arrayOfText = [[NSMutableArray alloc]initWithObjects:@"one",@"two",@"one",@"two",@"one",@"two",@"one",@"two",@"one",@"two",@"one",@"two",@"one",@"two",@"one",@"two",@"one",@"two",@"one",@"two",@"one",@"two",@"one",@"two",@"one",@"two",@"one",@"two", nil];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrayOfText count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    EvaluationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [[cell evaluationText]setText:[arrayOfText objectAtIndex:indexPath.item]];
    return cell;
}


@end
