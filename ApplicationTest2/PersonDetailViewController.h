//
//  PersonDetailViewController.h
//  ApplicationTest2
//
//  Created by Leonardo Cocerio on 06/09/2019.
//  Copyright © 2019 Leonardo Cocerio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonDetailViewController : UIViewController

 // l'equivalente degli extra passati nell'intent di android
// strong: non deve essere rilasciata, a meno di chiudere il view controller
@property (nonatomic, strong) NSMutableDictionary *person;

@end

NS_ASSUME_NONNULL_END
