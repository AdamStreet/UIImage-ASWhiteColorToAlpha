//
//  ASAsyncOverlaidChessBoardViewController.h
//  ASTransparentImage
//
//  Created by Adam Szabo on 15/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import "ASOverlaidChessBoardViewController.h"

typedef void(^ASAsyncOverlaidChessBoardViewControllerViewDidAppearLoadBlock)();

@interface ASAsyncOverlaidChessBoardViewController : ASOverlaidChessBoardViewController

@property (nonatomic, readonly) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, copy) ASAsyncOverlaidChessBoardViewControllerViewDidAppearLoadBlock loadBlockOnViewDidAppear;

@end
