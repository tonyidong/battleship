//
//  BSBoardViewController.m
//  BattleShip
//
//  Created by Adam Smith on 9/5/13.
//  Copyright (c) 2013 Adam Smith. All rights reserved.
//

#import "BSBoardViewController.h"
#import "BSGameBoard.h"
#import "BSBoardCollectionViewCell.h"
#import "BSGameManager.h"

@interface BSBoardViewController ()

@property (nonatomic, strong) IBOutlet UICollectionView* gridView;

@end

@implementation BSBoardViewController

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
	[self.gridView registerClass:[BSBoardCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
	
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return kBSBoardWidth;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	BSBoardCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
	cell.label.backgroundColor = (indexPath.item % 2 == 0) ? [UIColor lightGrayColor] : [UIColor whiteColor];
	
	NSArray* hitOrMissArray = [self.board hitOrMissArray];
	
	NSArray* column = [hitOrMissArray objectAtIndex:indexPath.section];
	BSHitMissState state = [[column objectAtIndex:indexPath.item] integerValue];

	NSString* text = @".";
	
	switch (state) {
		case BSHitMissStateUnguessed:
			text = @".";
			break;
		case BSHitMissStateMiss:
			text = @"-";
			break;
		case BSHitMissStateHit:
			text = @"X";
			break;
		default:
			break;
	}

	[cell.label setText:text];
	
	if ([self.board shipInPositionX:indexPath.item andY:indexPath.section]) {
		[cell.label setBackgroundColor:[UIColor blueColor]];
	} 
	
	return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return kBSBoardHeight;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	BOOL success;
	switch ([[BSGameManager sharedManager] currentGameState]) {
		case BSGameStateInitializePlayer1:
		case BSGameStateInitializePlayer2:
			success = [self.board placeGamePiece:[BSGamePiece initShip:BSBattleship withX:indexPath.item andY:indexPath.section]];
			if (!success) NSLog(@"Error");
			[self.gridView reloadData];
			if (self.board.gamePieces.count >= 3) {
				[[BSGameManager sharedManager] nextState];
				[self.navigationController popViewControllerAnimated:YES];
			}
			break;
			
		default:
			NSLog(@"invalid game state");
			break;
	}

}

@end
