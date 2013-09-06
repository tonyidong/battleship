//
//  BSGameManager.h
//  BattleShip
//
//  Created by Adam Smith on 9/5/13.
//  Copyright (c) 2013 Adam Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSPlayer.h"

typedef NS_ENUM(NSInteger, BSGameState) {
	BSGameStateInitializePlayer1,
	BSGameStateInitializePlayer2,
	BSGameStatePlayer1Turn,
	BSGameStatePlayer2Turn,
	BSGameStateGameOver
};

@interface BSGameManager : NSObject

@property BSGameState currentGameState;
@property (strong, nonatomic) BSPlayer* currentPlayer;

+(BSGameManager*)sharedManager;
-(void)startGame;
-(void)nextState;

@end
