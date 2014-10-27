//
//  ViewController.m
//  JKBlockAlert
//
//  Created by Jakey on 14-10-27.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "ViewController.h"
#import "JKBlockAlert.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testTouched:(id)sender {
    JKBlockAlert *alert = [[JKBlockAlert alloc]initWithTitle:@"提示" andMessage:@"动态添加按钮"];
    [alert addButtonWithTitle:@"确定"];
    [alert addButtonWithTitle:@"按钮1" handler:^(JKBlockAlert *alertView,JKBlockAlertItem *item) {
        NSLog(@"按钮1");
    }];
    [alert addButtonWithTitle:@"按钮2" handler:^(JKBlockAlert *alertView,JKBlockAlertItem *item) {
        NSLog(@"按钮2");
    }];
    [alert addButtonWithTitle:@"按钮3" handler:^(JKBlockAlert *alertView,JKBlockAlertItem *item) {
        NSLog(@"按钮3");
    }];
    [alert show];

}
@end
