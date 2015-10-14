//
//  ASTransparentImageTests.m
//  ASTransparentImageTests
//
//  Created by Adam Szabo on 13/10/2015.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "UIImage+WhiteToTransparent.h"

@interface ASTransparentImageTests : XCTestCase

@end

@implementation ASTransparentImageTests

/*- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}*/

- (void)testImageWhiteToAlphaSize {
	UIImage *image = [UIImage imageNamed:@"chessboard"];
	
	// Check test image
	XCTAssertNotNil(image, @"cannot find test image");
	XCTAssertFalse(CGSizeEqualToSize([image size], CGSizeZero), @"Invalid size of test image");
	
	// Get rendered image
	[self measureBlock:^{
		UIImage *renderedImage = [image imageWithWhiteToAlpha];
		
		XCTAssertNotNil(renderedImage, @"cannot render image");
		XCTAssertTrue(CGSizeEqualToSize([image size], [renderedImage size]), @"Invalid size of rendered image");
	}];
}

@end
