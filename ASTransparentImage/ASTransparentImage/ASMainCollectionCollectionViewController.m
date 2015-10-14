//
//  ASMainCollectionCollectionViewController.m
//  ASTransparentImage
//
//  Created by Adam Szabo on 14/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import "ASMainCollectionCollectionViewController.h"

#import "ASMainCollectionViewCell.h"
#import "ASItem.h"

@interface ASMainCollectionCollectionViewController ()

@property (nonatomic, readonly) UICollectionViewFlowLayout *defaultFlowLayout;

@end

static const CGFloat kGapAroundCollectionViewCells = 5.0;
static const CGFloat kCellHeight = 100.0;

@implementation ASMainCollectionCollectionViewController

@synthesize defaultFlowLayout = _defaultFlowLayout;

- (instancetype)initWithDefaultFlowLayout
{
	self = [super initWithCollectionViewLayout:self.defaultFlowLayout];
	
	return self;
}

#pragma mark - Private methods

#pragma mark Accessors

- (UICollectionViewFlowLayout *)defaultFlowLayout
{
	if (!_defaultFlowLayout) {
		_defaultFlowLayout = [[UICollectionViewFlowLayout alloc] init];
		_defaultFlowLayout.minimumInteritemSpacing = kGapAroundCollectionViewCells;
		_defaultFlowLayout.minimumLineSpacing = kGapAroundCollectionViewCells;
	}
	
	return _defaultFlowLayout;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.collectionView.backgroundColor = [UIColor lightGrayColor];
	self.collectionView.contentInset = UIEdgeInsetsMake(kGapAroundCollectionViewCells, kGapAroundCollectionViewCells, kGapAroundCollectionViewCells, kGapAroundCollectionViewCells);
    
    // Register cell classes
    [self.collectionView registerClass:[ASMainCollectionViewCell class]
			forCellWithReuseIdentifier:ASMainCollectionViewCellIdentifier];
}

#pragma mark - Public methods

#pragma mark Accessors 

- (void)setItems:(NSArray<ASItem *> *)items
{
	if (_items == items)	// Skip deep comparation
		return;
	
	_items = items;
	
	[self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	if (self.items)
		return 1;
	
	return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return [self.items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
				  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	ASMainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ASMainCollectionViewCellIdentifier
																			   forIndexPath:indexPath];
    
	cell.item = self.items[indexPath.row];
	
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	if ([self.delegate respondsToSelector:@selector(mainCollectionCollectionViewController:didSelectItemAtIndex:)]) {
		[self.delegate mainCollectionCollectionViewController:self didSelectItemAtIndex:indexPath.item];
	}
}

- (CGSize)collectionView:(UICollectionView *)collectionView
				  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	const CGFloat totalGap = (collectionView.contentInset.left + collectionView.contentInset.right);
	const CGFloat width = self.collectionView.bounds.size.width - totalGap;
	
	return CGSizeMake(width, kCellHeight);
}

@end
