//
//  ViewController.m
//  ncexample
//
//  Created by Murat Yılmaz on 18.12.2018.
//  Copyright © 2018 My. All rights reserved.
//

#import "ListViewController.h"
#import "FirstViewControlller.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "Character.h"
#import "CharacterCell.h"

@interface ListViewController ()
    @property (nonatomic, strong) UITableView *tableView;
    @property (nonatomic, strong) NSMutableArray<Character*> *actors;
    @property (nonatomic) id<DatabaseProtocol> database;
@end

@implementation ListViewController

- (instancetype)initWithDatabase:(id<DatabaseProtocol>)database {
    if(self = [super init]) {
        [self setDatabase:database];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.whiteColor];
    
    [self setupNavigationBar];
    [self setupTableView];
    [self reload];
}

- (void) reload {
    self.actors = [self.database fetchCharacters];
    [self.tableView reloadData];
}

- (void)handleAddButtonTap {
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Add New Character" message:NULL preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Full name";
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Nickname";
    }];
    
    UIAlertAction* add = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField* fullnameTextField = alertController.textFields[0];
        UITextField* nicknameTextField = alertController.textFields[1];
        if (![fullnameTextField.text isEqual: @""] && ![nicknameTextField.text isEqual: @""] ) {
            [self.database addCharacterWith:fullnameTextField.text nickName:nicknameTextField.text viewType:1];
            [self reload];
        }
    }];
    
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertController addAction:add];
    [alertController addAction:cancel];
    [self presentViewController:alertController animated:YES completion:NULL];
}

- (void)setupNavigationBar {
    [self.navigationItem setTitle: @"Characters"];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action:@selector(handleAddButtonTap)];
    [self.navigationItem setRightBarButtonItem: addButton];
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame: CGRectZero];
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.tableView registerClass:[CharacterCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView setDataSource: self];
    [self.tableView setDelegate: self];
    [self.view addSubview: self.tableView];
    
    [self.tableView.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = YES;
    [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
}

- (void) increaseViewCountFor: (NSString *) fullname {
    [self.database increaseViewCountFor:fullname];
    [self reload];
}

- (void) routeToDetailFor: (NSInteger) index {
    Character* character = self.actors[index];
    switch (character.viewType) {
            // immediately
        case 1: {
            [self increaseViewCountFor:character.fullname];
            FirstViewControlller * detailVC = [[FirstViewControlller alloc] initWith:character];
            [self.navigationController pushViewController:detailVC animated:YES];
            break;
        }
            // before disappear
        case 2: {
            SecondViewController* secondDetailVC = [[SecondViewController alloc] initWith:character];
            [secondDetailVC setDelegate:self];
            [self.navigationController pushViewController:secondDetailVC animated:YES];
            break;
        }
            // direct
        case 3: {
            ThirdViewController* thirdVC = [[ThirdViewController alloc] initWith:character];
            thirdVC.listVC = self;
            [self.navigationController pushViewController:thirdVC animated:YES];
            break;
        }
    }
}

// MARK: UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Character *actor = self.actors[indexPath.row];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = actor.fullname;
    NSString *viewCountString = [NSString stringWithFormat:@"%lli kere görüntülendi", actor.viewCount];
    cell.detailTextLabel.text = viewCountString;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.actors.count;
}

// MARK: UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self routeToDetailFor:indexPath.row];
}

// MARK: SecondViewControllerDelegate
- (void)secondViewWillDisappearWith:(Character *)character {
    [self increaseViewCountFor:character.fullname];
}

@end
