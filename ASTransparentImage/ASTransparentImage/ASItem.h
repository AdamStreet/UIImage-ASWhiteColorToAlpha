//
//  ASItem.h
//  ASTransparentImage
//
//  Created by Adam Szabo on 14/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASItem : NSObject

@property (nonatomic, readonly, copy) NSString * _Nonnull title;
@property (nonatomic, readonly, strong) NSString * _Nullable imageName;
@property (nonatomic, readonly) BOOL isTranslucent;
@property (nonatomic, readonly) BOOL putOnChessBoard;
@property (nonatomic, readonly) BOOL loadAsync;

+ (nonnull instancetype)itemWithTitle:(nonnull NSString *)title
							imageName:(nullable NSString *)imageName
						  translucent:(BOOL)isTranslucent
					  putOnChessBoard:(BOOL)putOnChessBoard
							loadAsync:(BOOL)loadAsync;

@end
