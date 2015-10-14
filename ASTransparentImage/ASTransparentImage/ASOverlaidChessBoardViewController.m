//
//  ASOverlaidChessBoardViewController.m
//  ASTransparentImage
//
//  Created by Adam Szabo on 14/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import "ASOverlaidChessBoardViewController.h"

@interface ASOverlaidChessBoardViewController ()

@end


@implementation ASOverlaidChessBoardViewController

@synthesize overlayImageView = _overlayImageView;

#pragma mark - View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UIImageView *overlayImageView = self.overlayImageView;
	[self.view addSubview:overlayImageView];
	
	// Autolayout
	
	overlayImageView.translatesAutoresizingMaskIntoConstraints = NO;
	
	NSDictionary *subviews = NSDictionaryOfVariableBindings(overlayImageView);
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[overlayImageView]|"
																	  options:0
																	  metrics:nil
																		views:subviews]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[overlayImageView]|"
																	  options:0
																	  metrics:nil
																		views:subviews]];
}

#pragma mark - Public methods

#pragma mark Accessors

- (UIImageView *)overlayImageView
{
	if (!_overlayImageView) {
		_overlayImageView = [[UIImageView alloc] initWithImage:nil];
		_overlayImageView.contentMode = UIViewContentModeScaleAspectFill;
		_overlayImageView.clipsToBounds = YES;
	}
	
	return _overlayImageView;
}


@end
