//
//  BSPlayer.h
//  BattleShip
//
//  Created by Adam Smith on 9/5/13.
//  Copyright (c) 2013 Adam Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSGameBoard.h"

@interface BSPlayer : NSObject

@property (strong, nonatomic) BSGameBoard* board;
@property (strong, nonatomic) BSGameBoard* guessedGrid;

@end
