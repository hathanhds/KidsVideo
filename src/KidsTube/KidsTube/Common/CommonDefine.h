//
//  CommonDefine.h
//  KidsTube
//
//  Created by Xuan Xuxu on 11/6/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h


#endif /* CommonDefine_h */
#define BASE_TAG 1000
#define HEIGHT_STATUS_BAR 21
#define HEIGHT_TABBAR 50

#define TITLE_SUBMIT @"Submit"
#define TITLE_OK @"OK"
#define TITLE_ERROR @"Lỗi"

#define MESSGAE_PASSWORD @"Nhập mật khẩu có 6 ký tự"
#define MESSAGE_ERROR_PASSSWORD @"Mật khẩu không đúng"



typedef NS_ENUM (NSInteger,TAB_TAG) {
    TAB_TAG_HOME = BASE_TAG,
    TAB_TAG_BOOKMARK ,
    TAB_TAG_HISTORY ,
    TAB_TAG_SEARCH ,
    TAB_TAG_SETTING
};


/** Float: Portrait Screen Height **/
#define SCREEN_HEIGHT_PORTRAIT ( [[UIScreen mainScreen ] bounds ].size.height )

/** Float: Portrait Screen Width **/
#define SCREEN_WIDTH_PORTRAIT ( [[UIScreen mainScreen ] bounds ].size.width )

#define NAV_COLOR @"2E1355"

