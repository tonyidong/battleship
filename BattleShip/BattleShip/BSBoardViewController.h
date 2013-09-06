//
//  BSBoardViewController.h
//  BattleShip
//
//  Created by Adam Smith on 9/5/13.
//  Copyright (c) 2013 Adam Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSGameBoard.h"

@interface BSBoardViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property BSGameBoard* board;

@end
