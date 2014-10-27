JKBlockAlert
============

基于block回调的UIAlertView实现

使用试例
<pre>

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
  </pre>
