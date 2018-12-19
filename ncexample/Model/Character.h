//
//  Character.h
//  ncexample
//
//  Created by Murat Yılmaz on 19.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Character : NSManagedObject

@property (nonatomic, strong) NSString *fullname;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic) int64_t viewCount;
@property (nonatomic) int64_t viewType;

+ (instancetype)insertItemWithTitle:(NSString*)fullname nick:(NSString*)nickname
                           viewType: (int64_t) viewType inManagedObjectContext:(NSManagedObjectContext*)managedObjectContext;

@end
