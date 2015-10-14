//
//  ASChessBoardViewController.m
//  ASTransparentImage
//
//  Created by Adam Szabo on 14/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import "ASChessBoardViewController.h"

@interface ASChessBoardViewController ()

@end


@implementation ASChessBoardViewController

@synthesize chessboardImageView = _chessboardImageView;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	UIImageView *chessboardImageView = self.chessboardImageView;
	[self.view addSubview:chessboardImageView];
	
	// Autolayout
	
	chessboardImageView.translatesAutoresizingMaskIntoConstraints = NO;
	
	NSDictionary *subviews = NSDictionaryOfVariableBindings(chessboardImageView);
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[chessboardImageView]|"
																	  options:0
																	  metrics:nil
																		views:subviews]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[chessboardImageView]|"
																	  options:0
																	  metrics:nil
																		views:subviews]];
}

#pragma mark - Public methods

#pragma mark Accessors

- (UIImageView *)chessboardImageView
{
	if (!_chessboardImageView) {
		_chessboardImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chessboard"]];
		_chessboardImageView.contentMode = UIViewContentModeScaleAspectFill;
		_chessboardImageView.clipsToBounds = YES;
	}
	
	return _chessboardImageView;
}

@end
