//
//  DefaultDataManager.m
//  KidsTube
//
//  Created by Xuan Xuxu on 11/13/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import "DefaultDataManager.h"

static DefaultDataManager *_instance;
NSString * const kPassword = @"pass_word";

@implementation DefaultDataManager

+ (DefaultDataManager *)shareInstance {
    if (!_instance) {
        _instance = [[DefaultDataManager alloc] init];
    }
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _password = [self integerForKey:kPassword defaultValue:0];
        
    }
    return self;
}


#pragma mark - private instance methodv

- (NSInteger)integerForKey:(NSString *)key
              defaultValue:(NSInteger)defaultValue
{
    NSUserDefaults *standard = [NSUserDefaults standardUserDefaults];
    NSNumber *value = [standard objectForKey:key];
    if (value) {
        return [value integerValue];
    }
    return defaultValue;
}

- (void)setInteger:(NSInteger)value
            forKey:(NSString *)key
{
    NSUserDefaults *standard = [NSUserDefaults standardUserDefaults];
    [standard setObject:@(value)
                 forKey:key];
    [standard synchronize];
}


- (NSString *)stringForKey:(NSString *)key
              defaultValue:(NSString *)defaultValue
{
    NSUserDefaults *standard = [NSUserDefaults standardUserDefaults];
    NSString *value = [standard objectForKey:key];
    if (value) {
        return value;
    }
    return defaultValue;
}

- (void)setString:(NSString *)value
           forKey:(NSString *)key
{
    NSUserDefaults *standard = [NSUserDefaults standardUserDefaults];
    [standard setObject:value
                 forKey:key];
    [standard synchronize];
}

@end
