//
//  ViewController.m
//  ASTransparentImage
//
//  Created by Adam Szabo on 13/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import "ASMainViewController.h"

#import "UIImage+WhiteColorToAlpha.h"
#import "ASMainCollectionCollectionViewController.h"
#import "ASItem.h"
#import "ASOverlaidChessBoardViewController.h"
#import "ASItemPlistConverter.h"

@interface ASMainViewController () <ASMainCollectionCollectionViewControllerDelegate>

@property (nonatomic, readonly) NSArray<ASItem *> *items;

@property (nonatomic, readonly) ASMainCollectionCollectionViewController *mainCollectionCollectionViewController;

@end


@implementation ASMainViewController

@synthesize items = _items;
@synthesize mainCollectionCollectionViewController = _mainCollectionCollectionViewController;

#pragma mark - Initialization

- (instancetype)initWithoutNib
{
	self = [super initWithoutNib];
	if (self) {
		self.title = @"Demo";
	}
	
	return self;
}

#pragma mark - Private methods

- (NSArray<ASItem *> *)items
{
	if (!_items) {
		NSString *itemDetailsPlistPath = [[NSBundle mainBundle] pathForResource:@"ItemDetails" ofType:@"plist"];
		
		NSAssert(itemDetailsPlistPath, @"Item details plist cannot be found");
		
		_items = [ASItemPlistConverter itemsFromPlist:itemDetailsPlistPath];
	}
	
	return _items;
}

#pragma mark Accessors

- (ASMainCollectionCollectionViewController *)mainCollectionCollectionViewController
{
	if (!_mainCollectionCollectionViewController) {
		_mainCollectionCollectionViewController = [[ASMainCollectionCollectionViewController alloc] initWithDefaultFlowLayout];
	}
	
	return _mainCollectionCollectionViewController;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	
	ASMainCollectionCollectionViewController *mainCollectionCollectionViewController = self.mainCollectionCollectionViewController;
	mainCollectionCollectionViewController.delegate = self;
	
	// Add child view controller
	
	[mainCollectionCollectionViewController willMoveToParentViewController:self];
	UIView *mainCollectionCollectionViewControllerView = mainCollectionCollectionViewController.view;
	[self.view addSubview:mainCollectionCollectionViewControllerView];
	[self addChildViewController:mainCollectionCollectionViewController];
	[mainCollectionCollectionViewController didMoveToParentViewController:self];
	
	// Autolayout
	
	mainCollectionCollectionViewControllerView.translatesAutoresizingMaskIntoConstraints = NO;
	
	NSDictionary *subviews = NSDictionaryOfVariableBindings(mainCollectionCollectionViewControllerView);
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[mainCollectionCollectionViewControllerView]|"
																	  options:0
																	  metrics:nil
																		views:subviews]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[mainCollectionCollectionViewControllerView]|"
																	  options:0
																	  metrics:nil
																		views:subviews]];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	self.mainCollectionCollectionViewController.items = self.items;
}

#pragma mark - ASMainCollectionCollectionViewControllerDelegate

- (void)mainCollectionCollectionViewController:(ASMainCollectionCollectionViewController *)mainCollectionCollectionViewController didSelectItemAtIndex:(NSInteger)index
{
	ASItem *selectedItem = self.items[index];
	
	ASOverlaidChessBoardViewController *overlaidChessBoardViewController = [[ASOverlaidChessBoardViewController alloc] initWithoutNib];
	overlaidChessBoardViewController.title = selectedItem.title;
	UIImage *image = nil;
	if ([selectedItem.imageName length]) {
		image = [UIImage imageNamed:selectedItem.imageName];
		
		if (selectedItem.isTranslucent) {
			image = [image imageWithWhiteColorToAlpha];
		}
	}
	overlaidChessBoardViewController.overlayImageView.image = image;
	overlaidChessBoardViewController.chessboardImageView.hidden = !selectedItem.putOnChessBoard;
	
	NSAssert(self.navigationController, @"Missing containing UINavigationController");
	
	[self.navigationController pushViewController:overlaidChessBoardViewController
										 animated:YES];
	
}

@end
