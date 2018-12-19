//
//  AppDelegate.h
//  ncexample
//
//  Created by Murat Yılmaz on 18.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppRouter.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AppRouter *router;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

