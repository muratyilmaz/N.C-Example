//
//  AppRouter.m
//  ncexample
//
//  Created by Murat Yılmaz on 18.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import "AppRouter.h"
#import "ListViewController.h"
#import "ListViewController.h"
#import "CharacterDatabase.h"

@implementation AppRouter

- (instancetype)initWithWindow:(UIWindow *)window {
    if (self = [super init]) {
        _navigationController = [[UINavigationController alloc] init];
    }
    [window setRootViewController:_navigationController];
    [window makeKeyAndVisible];
    return self;
}

- (void) start {
    CharacterDatabase *database = [[CharacterDatabase alloc] init];
    ListViewController *listVC = [[ListViewController alloc] initWithDatabase:database];
    [self.navigationController setViewControllers: [[NSArray alloc] initWithObjects:listVC, nil]];
}

@end
