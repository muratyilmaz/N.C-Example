//
//  SecondViewController.h
//  ncexample
//
//  Created by Murat Yılmaz on 19.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Character.h"

@protocol SecondViewControllerDelegate
-(void) secondViewWillDisappearWith: (Character*) character;
@end

@interface SecondViewController : UIViewController
    - (instancetype)initWith: (Character*) character;
    @property (nonatomic, weak) id<SecondViewControllerDelegate> delegate;
@end
