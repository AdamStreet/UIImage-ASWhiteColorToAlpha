//
//  ASAsyncOverlaidChessBoardViewController.m
//  ASTransparentImage
//
//  Created by Adam Szabo on 15/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import "ASAsyncOverlaidChessBoardViewController.h"

@interface ASAsyncOverlaidChessBoardViewController ()

@end

@implementation ASAsyncOverlaidChessBoardViewController

@synthesize activityIndicator = _activityIndicator;

#pragma mark - Private methods

#pragma mark Accessors

- (UIActivityIndicatorView *)activityIndicator
{
	if (!_activityIndicator) {
		_activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		_activityIndicator.hidesWhenStopped = YES;
	}
	
	return _activityIndicator;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIActivityIndicatorView *activityIndicator = self.activityIndicator;
	[self.view insertSubview:activityIndicator
				aboveSubview:self.overlayImageView];
	
	// Autolayout
	
	activityIndicator.translatesAutoresizingMaskIntoConstraints = NO;
	
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:activityIndicator
														  attribute:NSLayoutAttributeCenterX
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.view
														  attribute:NSLayoutAttributeCenterX
														 multiplier:1.0
														   constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:activityIndicator
														  attribute:NSLayoutAttributeCenterY
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.view
														  attribute:NSLayoutAttributeCenterY
														 multiplier:1.0
														   constant:0.0]];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	if (self.loadBlockOnViewDidAppear) {
		self.loadBlockOnViewDidAppear();
	}
}

@end
