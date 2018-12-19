//
//  CharacterDatabase.m
//  ncexample
//
//  Created by Murat Yılmaz on 19.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import "CharacterDatabase.h"
#import "AppDelegate.h"
#import "Character.h"

@interface CharacterDatabase () {
    AppDelegate *appDelegate;
    NSManagedObjectContext *context;
}

@end

@implementation CharacterDatabase

- (instancetype)init
{
    self = [super init];
    if (self) {
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        context = appDelegate.persistentContainer.viewContext;
    }
    return self;
}

- (NSArray<Character*>*)fetchCharacters {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Character"];
    NSError *error = nil;
    NSUInteger characterCount = [context countForFetchRequest:request error:&error];
    if (characterCount == 0) {
        [self populateCharacters];
    }
    NSArray *characters = [context executeFetchRequest:request error:&error];
    return characters;
}

- (void)addCharacterWith:(NSString *)fullname nickName:(NSString *)nickname viewType:(int64_t)type {
    [Character insertItemWithTitle:fullname nick:nickname viewType: 1 inManagedObjectContext:context];
    [appDelegate saveContext];
}

- (void)increaseViewCountFor:(NSString *)fullname {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Character"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"fullname == %@", fullname]];
    Character *character = [context executeFetchRequest:request error:NULL].firstObject;
    if (character) {
        character.viewCount += 1;
    }
    [appDelegate saveContext];
}

// Populate initial characters
- (void)populateCharacters {
    [Character insertItemWithTitle:@"John Snow" nick:@"King of the North" viewType: 1 inManagedObjectContext:context];
    [Character insertItemWithTitle:@"Balon Greyjoy" nick:@"King of the Iron Islands" viewType: 2 inManagedObjectContext:context];
    [Character insertItemWithTitle:@"Loren Lannister" nick:@"King of the Rock" viewType: 3 inManagedObjectContext:context];
    [appDelegate saveContext];
}

@end
