//
//  UserDefaultDB.h
//  ApplicationTest2
//
//  Created by Mojave-NB126 on 06/09/2019.
//  Copyright © 2019 Leonardo Cocerio. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDefaultDB : NSObject

+ (NSMutableArray *)getPeople;
+ (void)savePerson:(NSMutableDictionary *)person
      isInEditMode:(BOOL)editMode;
+ (void)deletePerson:(NSMutableDictionary *)person;
+ (NSInteger)getLastUsableID;

@end

NS_ASSUME_NONNULL_END
