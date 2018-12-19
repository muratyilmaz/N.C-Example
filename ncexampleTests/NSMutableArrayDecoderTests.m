//
//  ncexampleTests.m
//  ncexampleTests
//
//  Created by Murat Yılmaz on 18.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "NSMutableArray+Decoder.h"

@interface NSMutableArrayDecoderTests : XCTestCase

@end

@implementation NSMutableArrayDecoderTests

- (void)setUp {
    
}

- (void)testToJSON {
    // Given
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSDictionary* char1 = @{@"fullname": @"John snow"};
    NSDictionary* char2 = @{@"fullname": @"murat yılmaz"};
    
    // When
    [array addObject:char1];
    [array addObject:char2];
    
    //Then
    NSData* json = [array toJSON];
    XCTAssertNotNil(json);
    NSString *jsonString = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
    XCTAssertNotNil(jsonString);
}

@end
