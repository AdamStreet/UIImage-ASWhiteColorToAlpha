//
//  ASItem.h
//  ASTransparentImage
//
//  Created by Adam Szabo on 14/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASItem : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, strong) NSString *imageName;
@property (nonatomic, readonly) BOOL isTranslucent;
@property (nonatomic, readonly) BOOL putOnChessBoard;

+ (instancetype)itemWithTitle:(NSString *)title
					imageName:(NSString *)imageName
				  translucent:(BOOL)isTranslucent
			  putOnChessBoard:(BOOL)putOnChessBoard;

@end
