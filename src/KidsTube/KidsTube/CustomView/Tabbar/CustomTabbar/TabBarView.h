//
//  TabBarView.h
//  KidsTube
//
//  Created by Xuan Xuxu on 11/4/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *homeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bookmarkImageView;
@property (weak, nonatomic) IBOutlet UIImageView *historyImageView;
@property (weak, nonatomic) IBOutlet UIImageView *searchImageView;
@property (weak, nonatomic) IBOutlet UIImageView *settingImageView;

- (instancetype)initWithOwner:(id)owner frame:(CGRect)frame;
/*
 * Set state default tabbar
 */

- (void)setDefaultSelectedTab;

/*
 * set status seleted button
 */

- (void)setSatusSelectedTab: (NSInteger)tag;

/*
 * reset all state button
 */

- (void)resetAllStatusTab;

@end
