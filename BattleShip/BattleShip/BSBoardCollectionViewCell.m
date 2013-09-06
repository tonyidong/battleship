//
//  BSBoardCollectionViewCell.m
//  BattleShip
//
//  Created by Adam Smith on 9/5/13.
//  Copyright (c) 2013 Adam Smith. All rights reserved.
//

#import "BSBoardCollectionViewCell.h"

@implementation BSBoardCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {			
			_label = [[UILabel alloc] initWithFrame:self.contentView.bounds];
			[self.contentView addSubview:_label];
			_label.textAlignment = NSTextAlignmentCenter;
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
