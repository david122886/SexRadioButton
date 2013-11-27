//
//  SexRadioView.m
//  CaiJinTongApp
//
//  Created by david on 13-11-27.
//  Copyright (c) 2013年 david. All rights reserved.
//

#import "SexRadioView.h"
#import "QRadioButton.h"
@interface SexRadioView()<QRadioButtonDelegate>
@property(nonatomic,strong) void (^sexBlock)(NSString *text);
@property(nonatomic,strong) QRadioButton *manRadio;
@property(nonatomic,strong) QRadioButton *femaleRadio;
@end
static SexRadioView *defaultSexRadio = nil;
@implementation SexRadioView

+(SexRadioView*)defaultSexRadioViewWithFrame:(CGRect)frame selectedSex:(void (^)(NSString *sexText))sexBlock{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultSexRadio = [[SexRadioView alloc] init];
        QRadioButton *man = [[QRadioButton alloc] initWithDelegate:self groupId:@"sex"];
        [man setTitle:@"男" forState:UIControlStateNormal];
        [man setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [man.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [defaultSexRadio addSubview:man];
        [man setChecked:YES];
        defaultSexRadio.manRadio = man;
        
        QRadioButton *female = [[QRadioButton alloc] initWithDelegate:self groupId:@"sex"];
        [female setTitle:@"女" forState:UIControlStateNormal];
        [female setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [female.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [defaultSexRadio addSubview:female];
        [female setChecked:NO];
        defaultSexRadio.femaleRadio = female;
    });
    defaultSexRadio.frame = frame;
    defaultSexRadio.sexBlock = sexBlock;
    return defaultSexRadio;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)layoutSubviews{
    self.manRadio.frame = (CGRect){0,0,CGRectGetWidth(self.frame)/2,CGRectGetHeight(self.frame)};
    self.femaleRadio.frame = (CGRect){CGRectGetMaxX(self.manRadio.frame),0,CGRectGetWidth(self.frame)/2,CGRectGetHeight(self.frame)};
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark QRadioButtonDelegate
-(void)didSelectedRadioButton:(QRadioButton *)radio groupId:(NSString *)groupId{
    if (self.sexBlock) {
        self.sexBlock(radio.titleLabel.text);
    }
}
#pragma mark --
@end