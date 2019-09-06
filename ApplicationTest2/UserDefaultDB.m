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

- (NSInteger)getLastUsableID {
    
    NSInteger lastUsableId = 1;
    
    NSMutableArray *people = [UserDefaultDB getPeople];
    
    NSSortDescriptor *sortById = [NSSortDescriptor sortDescriptorWithKey:@"id"
                                                               ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortById];
    
    [people sortUsingDescriptors:sortDescriptors];
    
    if(people.count > 0) {
        NSDictionary *person = people[people.count - 1];
        
        lastUsableId = [person[@"id"] integerValue] + 1;
        
    }
    
    return lastUsableId;
}

@end
