//
//  ViewController.h
//  ApplicationTest2
//
//  Created by Leonardo Cocerio on 06/09/2019.
//  Copyright © 2019 Leonardo Cocerio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

    __weak IBOutlet UITableView *peopleTableView;

    NSMutableArray *people;

}

@end

