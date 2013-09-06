//
//  BSViewController.m
//  BattleShip
//
//  Created by Adam Smith on 9/5/13.
//  Copyright (c) 2013 Adam Smith. All rights reserved.
//

#import "BSViewController.h"
#import "BSBufferScreenViewController.h"
#import "BSGameManager.h"

@interface BSViewController ()

@end

@implementation BSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)startGameButtonPressed:(id)sender {
	[[BSGameManager sharedManager] startGame];
	BSBufferScreenViewController* bufferVC = [[BSBufferScreenViewController alloc] initWithNibName:@"BSBufferScreenViewController" bundle:nil];
	[self.navigationController pushViewController:bufferVC animated:YES];	
}

@end
