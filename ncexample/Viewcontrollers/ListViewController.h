//
//  ViewController.h
//  ncexample
//
//  Created by Murat Yılmaz on 18.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseProtocol.h"
#import "SecondViewController.h"

@interface ListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, SecondViewControllerDelegate>
- (instancetype)initWithDatabase: (id<DatabaseProtocol>) database;
- (void) increaseViewCountFor: (NSString *) fullname;
@end

