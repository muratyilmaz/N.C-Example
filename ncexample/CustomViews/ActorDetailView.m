//
//  ActorDetailView.m
//  ncexample
//
//  Created by Murat Yılmaz on 19.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import "ActorDetailView.h"

@interface ActorDetailView ()
    @property (nonatomic, strong) UITextField *nameTextfield;
    @property (nonatomic, strong) UITextField *nickTextfield;
@end

@implementation ActorDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInitializer];
    }
    return self;
}

- (void) commonInitializer {
    [self setBackgroundColor:UIColor.darkGrayColor];
    [self.layer setCornerRadius:8];
    [self.layer setMasksToBounds:YES];
    [self setupTextFields];
    [self setupStackView];
}

- (void)setupTextFields {
    self.nameTextfield = [[UITextField alloc] init];
    self.nickTextfield = [[UITextField alloc] init];
    [self.nameTextfield setTextColor:UIColor.whiteColor];
    [self.nickTextfield setTextColor:UIColor.whiteColor];
}

- (void)setupStackView {
    UIStackView *stackView = [[UIStackView alloc] init];
    [stackView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [stackView setAxis: UILayoutConstraintAxisVertical];
    [stackView setDistribution: UIStackViewDistributionFill];
    [stackView setAlignment: UIStackViewAlignmentCenter];
    
    [stackView addArrangedSubview: self.nameTextfield];
    [stackView addArrangedSubview: self.nickTextfield];
    
    [self addSubview:stackView];
    
    [stackView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [stackView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
}

- (void)updateWith: (NSString*) fullname nickname: (NSString*) nick {
    [self.nameTextfield setText:fullname];
    [self.nickTextfield setText:nick];
}

@end
