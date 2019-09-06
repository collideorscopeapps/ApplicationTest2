//
//  ViewController.m
//  ApplicationTest2
//
//  Created by Leonardo Cocerio on 06/09/2019.
//  Copyright © 2019 Leonardo Cocerio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Methods

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


@end
