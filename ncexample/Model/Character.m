//
//  Character.m
//  ncexample
//
//  Created by Murat Yılmaz on 19.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import "Character.h"

@implementation Character
    @dynamic fullname;
    @dynamic nickname;
    @dynamic viewCount;
    @dynamic viewType;

+ (instancetype)insertItemWithTitle:(NSString *)fullname nick:(NSString *)nickname viewType:(int64_t)viewType inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
    Character* character = [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                                         inManagedObjectContext:managedObjectContext];
    character.fullname = fullname;
    character.nickname = nickname;
    character.viewType = viewType;
    character.viewCount = 0;
    return character;
}

+ (NSString*)entityName
{
    return @"Character";
}

@end
