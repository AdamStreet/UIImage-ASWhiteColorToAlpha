//
//  ASItemPlistConverter.h
//  ASTransparentImage
//
//  Created by Adam Szabo on 14/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASItem.h"

@interface ASItemPlistConverter : NSObject

+ (nullable NSArray<ASItem *> *)itemsFromPlist:(nonnull NSString *)path;

@end
