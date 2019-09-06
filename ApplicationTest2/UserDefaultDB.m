//
//  UserDefaultDB.m
//  ApplicationTest2
//
//  Created by Mojave-NB126 on 06/09/2019.
//  Copyright © 2019 Leonardo Cocerio. All rights reserved.
//

#import "UserDefaultDB.h"

@implementation UserDefaultDB

+ (NSMutableArray *)getPeople {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    return [userDefaults objectForKey:@"people"];
    
}




@end
