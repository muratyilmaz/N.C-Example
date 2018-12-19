//
//  ThirdViewController.h
//  ncexample
//
//  Created by Murat Yılmaz on 19.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Character.h"
#import "ListViewController.h"

@interface ThirdViewController : UIViewController

@property (nonatomic, weak) ListViewController* listVC;

- (instancetype)initWith: (Character *) character;

@end
