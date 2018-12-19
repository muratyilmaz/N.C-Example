//
//  ActorDetailView.h
//  ncexample
//
//  Created by Murat Yılmaz on 19.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ActorDetailView : UIView
- (void)updateWith: (NSString*) fullname nickname: (NSString*) nick;
@end

NS_ASSUME_NONNULL_END
