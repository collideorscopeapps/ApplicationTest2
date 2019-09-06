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

+ (NSInteger)getLastUsableID {
    
    NSInteger lastUsableId = 1;
    
    NSArray *temp = [UserDefaultDB getPeople];
    
    NSMutableArray *people = [NSMutableArray arrayWithArray:temp];
    
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

+ (void)savePerson:(NSMutableDictionary *)person isInEditMode:(BOOL)editMode {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if(editMode) {
        
        //TODO
        /*
        NSArray *temp = [UserDefaultDB getPeople];
        
        NSMutableArray *people = [NSMutableArray arrayWithArray:temp];
        NSInteger replaceId = [person[@"id"] integerValue] + 1;
        
        [people replaceObjectAtIndex:replaceId withObject:person];
        
        [userDefaults setObject:people
                         forKey:@"people"];
        */
    }
    else {
        // inserimento nuovo contatto
        
        NSArray *temp = [UserDefaultDB getPeople];
        
        NSMutableArray *people = [NSMutableArray arrayWithArray:temp];
        
        //[self getPeople];
        
        if (!people) {
            
            people = [NSMutableArray array];
        }
        
        [people addObject:person];
        
        [userDefaults setObject:people
                         forKey:@"people"];
    }
    
    [userDefaults synchronize];
}

@end
