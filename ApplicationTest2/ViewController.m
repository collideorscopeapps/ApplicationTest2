//
//  ViewController.m
//  ApplicationTest2
//
//  Created by Leonardo Cocerio on 06/09/2019.
//  Copyright © 2019 Leonardo Cocerio. All rights reserved.
//

#import "ViewController.h"
#import "UserDefaultDB.h"
#import "PersonDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Methods

- (IBAction)addPerson:(id)sender {
    
}

#pragma mark - Methods

- (void)openPersonDetailViewController:(NSMutableDictionary *)person {
    
    PersonDetailViewController *personDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"personDetailViewController"];
    
    // l'equivalente degli extra passati nell'intent di android
    personDetailVC.person = person;
    
    // equivalente dell'intent start
    [self.navigationController pushViewController:personDetailVC animated:YES];
    
}

- (void)loadPeople {
    
    people = [UserDefaultDB getPeople];
    
    [peopleTableView reloadData];
}


#pragma mark - TableView Delegate and Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    NSDictionary *person = people[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", person[@"name"], person[@"lastName"]];
    
    cell.detailTextLabel.text = person[@"address"];
    
    return cell;
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:<#animated#>];
    
    [self loadPeople];
}

@end
