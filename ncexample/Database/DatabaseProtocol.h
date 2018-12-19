//
//  DatabaseProtocol.h
//  ncexample
//
//  Created by Murat Yılmaz on 19.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DatabaseProtocol <NSObject>
- (NSMutableArray *)fetchCharacters;
- (void)addCharacterWith: (NSString*) fullname
                              nickName: (NSString*) nickname viewType: (int64_t) type;
- (void)increaseViewCountFor: (NSString *) fullname;
@end
