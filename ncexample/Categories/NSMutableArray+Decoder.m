//
//  NSMutableArray+Decoder.m
//  ncexample
//
//  Created by Murat Yılmaz on 19.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import "NSMutableArray+Decoder.h"

@implementation NSMutableArray (Decoder)

- (nullable NSData *)toJSON {
    NSError *error = nil;
    NSData *json = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error != nil) {
        return NULL; 
    }
    return json;
}

@end
