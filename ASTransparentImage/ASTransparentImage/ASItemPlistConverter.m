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

@implementation ASItemPlistConverter

+ (nullable NSArray<ASItem *> *)itemsFromPlist:(nonnull NSString *)path
{
	NSParameterAssert(path);
	
	NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
	
	NSMutableArray<ASItem *> *items = [NSMutableArray arrayWithCapacity:[plistArray count]];
	[plistArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		[items addObject:[ASItem itemWithTitle:[obj objectForKey:kPlistTitleKey]
									 imageName:[obj objectForKey:kPlistOverlayImageNameKey]
								   translucent:[[obj objectForKey:kPlistTranslucentKey] boolValue]
							   putOnChessBoard:[[obj objectForKey:kPlistPutOnChessBoardKey] boolValue]]];
	}];
	
	return [items copy];
}

@end
