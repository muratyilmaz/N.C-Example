//
//  AppRouter.h
//  ncexample
//
//  Created by Murat Yılmaz on 18.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppRouter : NSObject

@property (strong, nonatomic) UINavigationController *navigationController;

- (instancetype)initWithWindow: (UIWindow *) window;
- (void) start;

@end
