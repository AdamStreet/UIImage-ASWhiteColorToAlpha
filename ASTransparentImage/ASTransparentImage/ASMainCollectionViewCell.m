//
//  ASMainCollectionViewCell.m
//  ASTransparentImage
//
//  Created by Adam Szabo on 14/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import "ASMainCollectionViewCell.h"

#import "ASItem.h"

NSString * const ASMainCollectionViewCellIdentifier = @"ASMainCollectionViewCell";

@interface ASMainCollectionViewCell ()
{
	UILabel *titleLabel;
}

@end

@implementation ASMainCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor whiteColor];
		
		titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		titleLabel.backgroundColor = [UIColor clearColor];
		titleLabel.numberOfLines = 0;
		titleLabel.textAlignment = NSTextAlignmentCenter;
		titleLabel.textColor = [UIColor grayColor];
		[self addSubview:titleLabel];
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
		
		NSDictionary *subviews = NSDictionaryOfVariableBindings(titleLabel);
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[titleLabel]|"
																	 options:0
																	 metrics:nil
																	   views:subviews]];
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[titleLabel]|"
																	 options:0
																	 metrics:nil
																	   views:subviews]];
	}
	
	return self;
}

#pragma mark - Public methods

#pragma mark Accessors

- (void)setItem:(ASItem *)item
{
	if (_item == item)
		return;
	
	_item = item;
	
	titleLabel.text = item.title;
}

@end
