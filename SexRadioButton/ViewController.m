//
//  ViewController.m
//  SexRadioButton
//
//  Created by david on 13-11-27.
//  Copyright (c) 2013年 david. All rights reserved.
//

#import "ViewController.h"
#import "SexRadioView.h"
@interface ViewController ()
- (IBAction)testSexRadioBtClicked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SexRadioView *sexRadioView = [SexRadioView defaultSexRadioViewWithFrame:(CGRect){20,300,200,40} withDefaultSex:nil selectedSex:^(NSString *sexText) {
        NSLog(@"%@",sexText);
    }];
    [self.view addSubview:sexRadioView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testSexRadioBtClicked:(id)sender {
    [SexRadioView defaultSexRadioViewWithFrame:(CGRect){20,300,200,40} withDefaultSex:@"female" selectedSex:^(NSString *sexText) {
        NSLog(@"%@",sexText);
    }];
}
@end
