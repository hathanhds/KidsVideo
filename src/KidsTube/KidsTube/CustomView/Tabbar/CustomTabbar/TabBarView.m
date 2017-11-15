//
//  TabBarView.m
//  KidsTube
//
//  Created by Xuan Xuxu on 11/4/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import "TabBarView.h"
#import "CommonDefine.h"

NSString * const kTabbarNibName = @"TabBarView";

@implementation TabBarView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UINib *nib = [UINib nibWithNibName:kTabbarNibName bundle:nil];
        self = [nib instantiateWithOwner:self options:nil].firstObject;
        CGRect viewFrame = CGRectMake(0, frame.size.height - self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
        self.frame = viewFrame;
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        UINib *nib = [UINib nibWithNibName:kTabbarNibName bundle:nil];
        self = [nib instantiateWithOwner:self options:nil].firstObject;
    }
    return self;
}

- (instancetype)initWithOwner:(id)owner frame:(CGRect)frame {
    if (self = [super init]) {
        UINib *nib = [UINib nibWithNibName:kTabbarNibName bundle:nil];
        self = [nib instantiateWithOwner:self options:nil].firstObject;
        CGRect viewFrame = CGRectMake(0, frame.size.height - self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
        self.frame = viewFrame;
    }
    return self;
}

/**
 * Set all action with tabbar
 */

- (IBAction)actionButtonTabbar:(id)sender {
    [self setSelectedButton:sender];
}

- (void)setSelectedButton: (UIButton *)button {
    [self resetAllStatusTab];
        switch (button.tag) {
            case TAB_TAG_HOME:
                self.homeImageView.image = [UIImage imageNamed:@"ic_home_selected"];
                break;
            case TAB_TAG_BOOKMARK:
                self.bookmarkImageView.image = [UIImage imageNamed:@"ic_bookmark_selected"];
                break;
            case TAB_TAG_HISTORY:
                self.historyImageView.image = [UIImage imageNamed:@"ic_history_selected"];
                break;
            case TAB_TAG_SEARCH:
                self.searchImageView.image = [UIImage imageNamed:@"ic_search_selected"];
                break;
            case TAB_TAG_SETTING:
                self.settingImageView.image = [UIImage imageNamed:@"ic_setting_selected"];
                break;
            default:
                //do nothing
                break;
    }
}

- (void)setDefaultSelectedTab {
    UIButton *button = (UIButton *)[self viewWithTag:TAB_TAG_HOME];
    [self setSelectedButton:button];
}

- (void)setSatusSelectedTab:(NSInteger)tag {
    UIButton *button = (UIButton *)[self viewWithTag:tag];
    [self setSelectedButton:button];
}

- (void)resetAllStatusTab {
    self.homeImageView.image = [UIImage imageNamed:@"ic_home"];
    self.bookmarkImageView.image = [UIImage imageNamed:@"ic_bookmark"];
    self.historyImageView.image = [UIImage imageNamed:@"ic_history"];
    self.searchImageView.image = [UIImage imageNamed:@"ic_search"];
    self.settingImageView.image = [UIImage imageNamed:@"ic_setting"];
}

@end
