//
//  SecondViewController.m
//  ncexample
//
//  Created by Murat Yılmaz on 19.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import "SecondViewController.h"
#import "ActorDetailView.h"
#import "Character.h"

@interface SecondViewController ()
@property (nonatomic, strong) Character* character;
@end

@implementation SecondViewController

- (void)dealloc
{
    NSLog(@"Dealloc SecondViewController");
}

- (instancetype)initWith: (Character*) character {
    self = [super init];
    if (self) {
        _character = character;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Second"];
    [self.view setBackgroundColor:UIColor.whiteColor];
    [self setupActorDetailView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.delegate secondViewWillDisappearWith:self.character];
}

- (void)setupActorDetailView {
    ActorDetailView *actorDetailView = [[ActorDetailView alloc] initWithFrame:CGRectZero];
    actorDetailView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:actorDetailView];
    [actorDetailView updateWith:self.character.fullname nickname:self.character.nickname];
    
    [actorDetailView.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant:16].active = YES;
    [actorDetailView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:16].active = YES;
    [actorDetailView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-16].active = YES;
    [actorDetailView.heightAnchor constraintEqualToConstant:200].active = YES;
}
@end
