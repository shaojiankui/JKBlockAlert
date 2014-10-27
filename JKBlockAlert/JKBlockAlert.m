//
//  JKBlockAlert.m
//  JKBlockAlert
//
//  Created by Jakey on 14-10-27.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "JKBlockAlert.h"
#import <objc/runtime.h>

@interface JKBlockAlertItem : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) JKBlockAlertHandler action;
@end
@implementation JKBlockAlertItem
@end

static NSString *JK_ALERT_BUTTON_ASS_KEY = @"org.skyfox.alert.BUTTONS";

@implementation JKBlockAlert

- (id)initWithTitle:(NSString *)title andMessage:(NSString *)message
{
    self = [super initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    if (self)
    {
        _items = [[NSMutableArray alloc] init];
        [self setDelegate:self];
        
        for(JKBlockAlertItem *item in _items)
        {
            [super addButtonWithTitle:item.title];
        }
        objc_setAssociatedObject(self, (__bridge const void *)JK_ALERT_BUTTON_ASS_KEY, _items, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return self;
}

- (NSInteger)addButtonWithTitle:(NSString *)title{
    JKBlockAlertItem *item = [[JKBlockAlertItem alloc] init];
    item.title = title;
    item.action = nil;
    [_items addObject:item];
    objc_setAssociatedObject(self, (__bridge const void *)JK_ALERT_BUTTON_ASS_KEY, _items, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return [super addButtonWithTitle:title];
}

- (void)addButtonWithTitle:(NSString *)title  handler:(JKBlockAlertHandler)handler
{
    JKBlockAlertItem *item = [[JKBlockAlertItem alloc] init];
    item.title = title;
    item.action = handler;
    [_items addObject:item];
    [super addButtonWithTitle:title];
    
    objc_setAssociatedObject(self, (__bridge const void *)JK_ALERT_BUTTON_ASS_KEY, _items, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex >= 0)
    {
        NSArray *buttonsArray = objc_getAssociatedObject(self, (__bridge  const void *)JK_ALERT_BUTTON_ASS_KEY);
        JKBlockAlertItem *item = [buttonsArray objectAtIndex:buttonIndex];
        if(item.action)
            item.action((JKBlockAlert*)alertView,item);
    }
    
    objc_setAssociatedObject(self, (__bridge  const void *)JK_ALERT_BUTTON_ASS_KEY, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
