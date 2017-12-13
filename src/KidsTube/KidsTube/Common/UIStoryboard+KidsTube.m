//
//  UIStoryboard+KidsTube.m
//  KidsTube
//
//  Created by Xuan Xuxu on 11/6/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import "UIStoryboard+KidsTube.h"

@implementation UIStoryboard (KidsTube)

+ (UIStoryboard *)homeStoryboard {
    return [self storyboardWithName:@"Home" bundle:nil];
}

+ (UIStoryboard *)bookmarkStoryboard {
    return [self storyboardWithName:@"Bookmark" bundle:nil];
}

+ (UIStoryboard *)historyStoryboard {
    return [self storyboardWithName:@"History" bundle:nil];
}

+ (UIStoryboard *)searchStoryboard {
    return [self storyboardWithName:@"Search" bundle:nil];
}

+ (UIStoryboard *)settingStoryboard {
    return [self storyboardWithName:@"Setting" bundle:nil];
}

+ (UIStoryboard *)tabBarStoryboard {
    return [self storyboardWithName:@"TabBar" bundle:nil];
}

+ (UIStoryboard *)videoStoryboard {
    return [self storyboardWithName:@"Video" bundle:nil];
}

@end
