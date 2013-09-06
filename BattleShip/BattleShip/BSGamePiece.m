//
//  BSGamePiece.m
//  BattleShip
//
//  Created by Adam Smith on 9/5/13.
//  Copyright (c) 2013 Adam Smith. All rights reserved.
//

#import "BSGamePiece.h"

#define kBSPatrolBoatLength 2
#define kBSSubmarineLength 3
#define kBSCruiserLength 3
#define kBSBattleshipLength 4
#define kBSCarrierLength 5

@interface BSGamePiece ()



@end

@implementation BSGamePiece

+(BSGamePiece*)initShip:(BSShipType)shipType withX:(NSInteger)x andY:(NSInteger)y
{
	static int i = 0;
	BSGamePiece* ship = [[BSGamePiece alloc] init];
	[ship setX:x];
	[ship setY:y];
	[ship setIsHorizontal:(i++ % 2 == 0)];
	
	switch (shipType) {
		case BSPatrolBoat:
			[ship setLength:kBSPatrolBoatLength];
			break;
		case BSBattleship:
			[ship setLength:kBSBattleshipLength];
			break;
		case BSCarrier:
			[ship setLength:kBSCarrierLength];
			break;
		default:
			[ship setLength:kBSCruiserLength];
			break;
	}
	return ship;
}

-(NSInteger)width {
	int myWidth = 1;
	
	if (self.isHorizontal) {
		myWidth = self.length;
	}
	return myWidth;
}

-(NSInteger)height {

	if (!self.isHorizontal) {
		return self.length;
	} else {
		return 1;
	}
}

-(Boolean)collidesWith:(BSGamePiece*)gamePiece
{	
	return ((self.x < gamePiece.x + gamePiece.width) && (self.x + self.width > gamePiece.x) &&
					(self.y < gamePiece.y + gamePiece.height) && (self.y + self.height > gamePiece.y));
}

-(Boolean)isLocatedAtX:(NSInteger)x andY:(NSInteger)y
{
	int myWidth = 1;
	int myHeight = 1;
	
	if (self.isHorizontal) {
		myWidth = self.length;
	} else {
		myHeight = self.length;
	}
	
	NSLog(@"myWidth: %d",myWidth);
	NSLog(@"myX: %d",self.x);
	
	return ((x >= self.x) && (x < self.x + myWidth) && (y >= self.y) && (y < self.y + myHeight));
}

@end
