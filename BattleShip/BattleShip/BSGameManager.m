//
//  BSGameManager.m
//  BattleShip
//
//  Created by Adam Smith on 9/5/13.
//  Copyright (c) 2013 Adam Smith. All rights reserved.
//

#import "BSGameManager.h"

@implementation BSGameManager

+(BSGameManager*)sharedManager {
  static BSGameManager *__sharedManager;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    __sharedManager = [[BSGameManager alloc] init];
  });
  return __sharedManager;
}

-(void)startGame {
	self.currentGameState = BSGameStateInitializePlayer1;
}

-(void)nextState {
	self.currentGameState++;
}
@end
