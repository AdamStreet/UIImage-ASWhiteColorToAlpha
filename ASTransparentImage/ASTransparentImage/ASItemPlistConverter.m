//
//  ASItemPlistConverter.m
//  ASTransparentImage
//
//  Created by Adam Szabo on 14/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import "ASItemPlistConverter.h"

static NSString * const kPlistTitleKey = @"title";
static NSString * const kPlistOverlayImageNameKey = @"overlayImageName";
static NSString * const kPlistTranslucentKey = @"isTranslucent";
static NSString * const kPlistPutOnChessBoardKey = @"putOnChessBoard";
static NSString * const kPlistLoadAsyncKey = @"loadAsync";

@implementation ASItemPlistConverter

+ (nullable NSArray<ASItem *> *)itemsFromPlist:(nonnull NSString *)path
{
	NSParameterAssert(path);
	
	NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
	
	NSMutableArray<ASItem *> *items = [NSMutableArray arrayWithCapacity:[plistArray count]];
	[plistArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		NSString *title = [obj objectForKey:kPlistTitleKey];
		NSAssert(title, @"Missing 'title' property in plist");
		
		NSString *imageName = [obj objectForKey:kPlistOverlayImageNameKey];
		NSAssert(imageName, @"Missing 'overlayImageName' property in plist");
		
		NSNumber *isTranslucentValue = [obj objectForKey:kPlistTranslucentKey];
		NSAssert(isTranslucentValue, @"Missing 'isTranslucent' property in plist");
		
		NSNumber *putOnChessBoardValue = [obj objectForKey:kPlistPutOnChessBoardKey];
		NSAssert(putOnChessBoardValue, @"Missing 'putOnChessBoard' property in plist");
		
		NSNumber *loadAsyncValue = [obj objectForKey:kPlistLoadAsyncKey];
		NSAssert(loadAsyncValue, @"Missing 'loadAsync' property in plist");
		
		[items addObject:[ASItem itemWithTitle:title
									 imageName:imageName
								   translucent:[isTranslucentValue boolValue]
							   putOnChessBoard:[putOnChessBoardValue boolValue]
									 loadAsync:[loadAsyncValue boolValue]]];
	}];
	
	return [items copy];
}

@end
