//
//  JKBlockAlert.h
//  JKBlockAlert
//
//  Created by Jakey on 14-10-27.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JKBlockAlert;
@class JKBlockAlertItem;
typedef void(^JKBlockAlertHandler)(JKBlockAlert *alertView,JKBlockAlertItem *item);

@interface JKBlockAlert : UIAlertView<UIAlertViewDelegate>{
    NSMutableArray *_items;
}
- (NSInteger)addButtonWithTitle:(NSString *)title;
- (id)initWithTitle:(NSString *)title andMessage:(NSString *)message;
- (void)addButtonWithTitle:(NSString *)title  handler:(JKBlockAlertHandler)handler;
@end
