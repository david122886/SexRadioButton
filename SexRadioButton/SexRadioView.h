//
//  SexRadioView.h
//  CaiJinTongApp
//
//  Created by david on 13-11-27.
//  Copyright (c) 2013年 david. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SexRadioView : UIView
+(SexRadioView*)defaultSexRadioViewWithFrame:(CGRect)frame selectedSex:(void (^)(NSString *sexText))sexBlock;
@end
