//
//  DefaultDataManager.h
//  KidsTube
//
//  Created by Xuan Xuxu on 11/13/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DefaultDataManager : NSObject

@property (nonatomic, assign) NSInteger password;

+ (DefaultDataManager *)shareInstance;

@end
