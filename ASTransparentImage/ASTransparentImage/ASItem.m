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
@property (nonatomic, readwrite) BOOL loadAsync;

@end


@implementation ASItem

#pragma mark - Class methods

+ (nonnull instancetype)itemWithTitle:(nonnull NSString *)title
							imageName:(nullable NSString *)imageName
						  translucent:(BOOL)isTranslucent
					  putOnChessBoard:(BOOL)putOnChessBoard
							loadAsync:(BOOL)loadAsync
{
	return [[self alloc] initWithTitle:title
							 imageName:imageName
						   translucent:isTranslucent
					   putOnChessBoard:putOnChessBoard
							 loadAsync:loadAsync];
}

#pragma mark - Initialization

- (instancetype)initWithTitle:(NSString *)title
					imageName:(NSString *)imageName
				  translucent:(BOOL)isTranslucent
			  putOnChessBoard:(BOOL)putOnChessBoard
					loadAsync:(BOOL)loadAsync
{
	self = [super init];
	if (self) {
		self.title = title;
		self.imageName = imageName;
		self.isTranslucent = isTranslucent;
		self.putOnChessBoard = putOnChessBoard;
		self.loadAsync = loadAsync;
	}
	
	return self;
}

#pragma mark - Public methods

#pragma mark Overrides

- (NSString *)description
{
	return [NSString stringWithFormat:@"Title: %@\nImageName: %@\nIsTranslucent = %@\nPutOnChessBoard = %@\nLoadAsync = %@",
			self.title, self.imageName, @(self.isTranslucent), @(self.putOnChessBoard), @(self.loadAsync)];
}

@end
