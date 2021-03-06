//
//  CollectionViewViewController.m
//  iOperate
//
//  Created by Max Gilbert on 5/22/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "CollectionViewViewController.h"
#import "CustomCell.h"
@interface CollectionViewViewController (){
    NSMutableArray *arrayOfImages;
    NSMutableArray *arrayOfDescriptions;
    NSString *surgeryName;
    
    //IBOutletCollection(UIView) NSArray *nextPages;
}
- (IBAction)addSurgery:(id)sender;
- (IBAction)buttonPress:(UIButton *)sender;
@end

@implementation CollectionViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self myCollectionView]setDataSource:self];
    [[self myCollectionView]setDelegate:self];
	self.myCollectionView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.0];
    
    arrayOfImages = [[NSMutableArray alloc]initWithObjects:@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",nil];
    
    arrayOfDescriptions = [[NSMutableArray alloc]initWithObjects:@"Otorhinolaryngology",nil];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrayOfDescriptions count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [[cell myButton] setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]]forState:UIControlStateNormal];
    [[cell myDescriptionLabel]setText:[arrayOfDescriptions objectAtIndex:indexPath.item]];
    NSString *segueIdentifier = [NSString stringWithFormat:@"%d",indexPath.item];//[arrayOfDescriptions objectAtIndex:indexPath.item];
    [[cell myButton]setTitle:segueIdentifier forState:normal];
    [[cell myButton]setTag:indexPath.item];
    
	cell.myButton.layer.cornerRadius = 8.0f;
	cell.myButton.layer.masksToBounds = NO;
	cell.myButton.layer.borderWidth = 0.0f;
	cell.myButton.layer.shadowColor = [UIColor blackColor].CGColor;
	cell.myButton.layer.shadowOpacity = 0.2;
	cell.myButton.layer.shadowRadius = 5;
	cell.myButton.layer.shadowOffset = CGSizeMake(0.f, 10.0f);
	
	return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addSurgery:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Add Surgery:" message:@"Enter the name of the surgery" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add",nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1) {
        surgeryName = [[alertView textFieldAtIndex:0] text];
        self.title = surgeryName;
    }
}

- (IBAction)buttonPress:(UIButton *)sender {
    
    NSString *segueIdentifier = [NSString stringWithFormat:@"%d",sender.tag];
    //NSString *segueIdentifier =  sender.description;
    [self performSegueWithIdentifier:segueIdentifier sender:sender];
}
@end
