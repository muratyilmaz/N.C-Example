//
//  NSMutableArray+Decoder.h
//  ncexample
//
//  Created by Murat Yılmaz on 19.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Decoder)
- (NSData *)toJSON;
@end
