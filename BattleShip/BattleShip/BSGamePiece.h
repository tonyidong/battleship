//
//  BSGamePiece.h
//  BattleShip
//
//  Created by Adam Smith on 9/5/13.
//  Copyright (c) 2013 Adam Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BSShipType) {
	BSPatrolBoat,
	BSSubmarine,
	BSCruiser,
	BSBattleship,
	BSCarrier
};


@interface BSGamePiece : NSObject

@property NSInteger x;
@property NSInteger y;
@property Boolean isHorizontal;
@property NSInteger length;

+(BSGamePiece*)initShip:(BSShipType)shipType withX:(NSInteger)x andY:(NSInteger)y;
-(Boolean)collidesWith:(BSGamePiece*)gamePiece;
-(Boolean)isLocatedAtX:(NSInteger)x andY:(NSInteger)y;

-(NSInteger)width;
-(NSInteger)height;
@end
