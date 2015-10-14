//
//  ASMainCollectionViewCell.h
//  ASTransparentImage
//
//  Created by Adam Szabo on 14/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASItem;

extern NSString * const ASMainCollectionViewCellIdentifier;

@interface ASMainCollectionViewCell : UICollectionViewCell

@property (nonatomic, readwrite) ASItem *item;

@end
