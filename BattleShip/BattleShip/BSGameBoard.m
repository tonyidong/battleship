//
//  BSGameBoard.m
//  BattleShip
//
//  Created by Adam Smith on 9/5/13.
//  Copyright (c) 2013 Adam Smith. All rights reserved.
//

#import "BSGameBoard.h"



@implementation BSGameBoard

-(BSGameBoard*)init {
	self = [super init];
	if (self) {
		self.gamePieces = [NSMutableArray array];
		self.hitOrMissArray = [NSMutableArray arrayWithCapacity:kBSBoardWidth];
		for (int x = 0; x < kBSBoardWidth; x++) {
			NSMutableArray* verticalArray = [NSMutableArray arrayWithCapacity:kBSBoardHeight];
			for (int y = 0; y < kBSBoardHeight; y++) {
				[verticalArray addObject:@(BSHitMissStateUnguessed)];
			}
			[self.hitOrMissArray addObject:verticalArray];
		}
	}
	return self;
}


-(Boolean)placeGamePiece:(BSGamePiece*)gamePiece {
	if ([self doesNotCollideWith:gamePiece] && [self fitsOnBoard:gamePiece]) {
		[self.gamePieces addObject:gamePiece];
		return true;
	} else {
		return false;
	}
}

-(Boolean)fitsOnBoard:(BSGamePiece*)gamePiece {
	return ((gamePiece.x >= 0) && (gamePiece.x + gamePiece.width < kBSBoardWidth) &&
					(gamePiece.y >= 0) && (gamePiece.y + gamePiece.height < kBSBoardHeight));
}

-(Boolean)doesNotCollideWith:(BSGamePiece*)gamePiece {
	for (BSGamePiece* existingPiece in self.gamePieces) {
		if ([existingPiece collidesWith:gamePiece]) {
			return false;
		}
	}
	return true;
}

-(BSGamePiece*)shipInPositionX:(NSInteger)x andY:(NSInteger)y
{
	for (BSGamePiece* ship in self.gamePieces) {
		if ([ship isLocatedAtX:x andY:y]) {
			return ship;
		}
	}
	return nil;
}

@end
