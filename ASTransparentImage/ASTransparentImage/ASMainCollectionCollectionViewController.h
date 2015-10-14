//
//  ASMainCollectionCollectionViewController.h
//  ASTransparentImage
//
//  Created by Adam Szabo on 14/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASItem;
@protocol ASMainCollectionCollectionViewControllerDelegate;

@interface ASMainCollectionCollectionViewController : UICollectionViewController

@property (nonatomic, readwrite) id<ASMainCollectionCollectionViewControllerDelegate> delegate;

@property (nonatomic, readwrite) NSArray<ASItem *> *items;

- (instancetype)initWithDefaultFlowLayout;

@end


@protocol ASMainCollectionCollectionViewControllerDelegate <NSObject>

@optional
- (void)mainCollectionCollectionViewController:(ASMainCollectionCollectionViewController *)mainCollectionCollectionViewController didSelectItemAtIndex:(NSInteger)index;

@end