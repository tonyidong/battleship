//
//  BSBufferScreenViewController.h
//  BattleShip
//
//  Created by Adam Smith on 9/5/13.
//  Copyright (c) 2013 Adam Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSGameBoard.h"
@interface BSBufferScreenViewController : UIViewController

@property (nonatomic, strong) BSGameBoard *p1;
@property (nonatomic, strong) BSGameBoard *p2;

@end
