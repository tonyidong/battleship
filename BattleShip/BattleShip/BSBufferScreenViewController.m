//
//  BSBufferScreenViewController.m
//  BattleShip
//
//  Created by Adam Smith on 9/5/13.
//  Copyright (c) 2013 Adam Smith. All rights reserved.
//

#import "BSBufferScreenViewController.h"
#import "BSBoardViewController.h"
#import "BSGameBoard.h"
#import "BSGameManager.h"

@interface BSBufferScreenViewController ()

@end

@implementation BSBufferScreenViewController

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
    // Do any additional setup after loading the view from its nib.
	self.p1 = [BSGameBoard new];
	self.p2 = [BSGameBoard new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)startTurnButtonPressed:(id)sender {
	BSBoardViewController* boardVC = [[BSBoardViewController alloc] init];
	switch ([[BSGameManager sharedManager] currentGameState]) {
		case BSGameStateInitializePlayer1:
		case BSGameStatePlayer2Turn:
			[boardVC setBoard:self.p1];
			break;
			
		case BSGameStateInitializePlayer2:
		case BSGameStatePlayer1Turn:
			boardVC.board = self.p2;
		default:
			break;
	}

	[self.navigationController pushViewController:boardVC animated:YES];
}

@end
