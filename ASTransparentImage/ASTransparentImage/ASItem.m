//
//  ASItem.m
//  ASTransparentImage
//
//  Created by Adam Szabo on 14/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import "ASItem.h"

@interface ASItem ()

@property (nonatomic, readwrite, copy) NSString *title;
@property (nonatomic, readwrite, strong) NSString *imageName;
@property (nonatomic, readwrite) BOOL isTranslucent;
@property (nonatomic, readwrite) BOOL putOnChessBoard;

@end


@implementation ASItem

#pragma mark - Class methods

+ (instancetype)itemWithTitle:(NSString *)title
					imageName:(NSString *)imageName
				  translucent:(BOOL)isTranslucent
			  putOnChessBoard:(BOOL)putOnChessBoard
{
	return [[self alloc] initWithTitle:title
							 imageName:imageName
						   translucent:isTranslucent
					   putOnChessBoard:putOnChessBoard];
}

#pragma mark - Initialization

- (instancetype)initWithTitle:(NSString *)title
					imageName:(NSString *)imageName
				  translucent:(BOOL)isTranslucent
			  putOnChessBoard:(BOOL)putOnChessBoard
{
	self = [super init];
	if (self) {
		self.title = title;
		self.imageName = imageName;
		self.isTranslucent = isTranslucent;
		self.putOnChessBoard = putOnChessBoard;
	}
	
	return self;
}

#pragma mark - Public methods

#pragma mark Overrides

- (NSString *)description
{
	return [NSString stringWithFormat:@"Title: %@\nImageName: %@\nIsTranslucent = %@\nPutOnChessBoard = %@",
			self.title, self.imageName, @(self.isTranslucent), @(self.putOnChessBoard)];
}

@end
