//
//  BSGameBoard.h
//  BattleShip
//
//  Created by Adam Smith on 9/5/13.
//  Copyright (c) 2013 Adam Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSGamePiece.h"

#define kBSBoardWidth 10
#define kBSBoardHeight 10

typedef NS_ENUM(NSInteger, BSHitMissState) {
	BSHitMissStateUnguessed,
	BSHitMissStateMiss,
	BSHitMissStateHit
};

@interface BSGameBoard : NSObject

-(Boolean)placeGamePiece:(BSGamePiece*)gamePiece;

@property (strong, nonatomic) NSMutableArray* gamePieces;
@property (strong, nonatomic) NSMutableArray* hitOrMissArray;

-(BSGamePiece*)shipInPositionX:(NSInteger)x andY:(NSInteger)y;

@end
