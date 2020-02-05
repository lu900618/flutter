import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// 显示对话框的方法有两个
/// showAboutDialog() 用来弹出关于对话框
/// showDialog() 多种不同的对话框

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('widget aboutDialog')),
          body: Builder(
            builder: (context) => RaisedButton(
              onPressed: () {
//                showAboutDialog(
//                    context: context, // 上下文 必输
//                    applicationName: '提示：', // 应用名字
//                    applicationVersion: '1.0.0', // 应用的版本
//                );

//                showDialog(
//                    context: context,
//                    builder: (context) => SimpleDialog(
//                          title: Text('simple dialog'),
//                          children: <Widget>[
//                            SimpleDialogOption(
//                              child: Text('确定'),
//                              onPressed: () {
//                                Navigator.of(context).pop();
//                              },
//                            ),
//                            SimpleDialogOption(
//                              child: Text('取消'),
//                              onPressed: () {
//                                Navigator.of(context).pop(); // 关闭弹窗
//                              },
//                            )
//                          ],
//                        ));

//                showDialog(
//                    context: context,
//                    builder: (context) => AlertDialog(
//                          title: Text('Alert Dialog'),
//                          content: SingleChildScrollView(
//                            child: ListBody(
//                              children: <Widget>[
//                                Text('This is an alert dialog'),
//                                Text('add two options'),
//                              ],
//                            ),
//                          ),
//                          actions: <Widget>[
//                            FlatButton(
//                              child: Text('Ok'),
//                              onPressed: () {
//                                Navigator.of(context).pop();
//                              },
//                            ),
//                            FlatButton(
//                              child: Text('Cancel'),
//                              onPressed: () {
//                                Navigator.of(context).pop();
//                              },
//                            ),
//                          ],
//                        ));

                showDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                          title: Text('苹果风格的alert dialog'),
                          content: Text('这是苹果风格的alert dialog'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ));
              },
              child: Text('show'),
            ),
          ),
        ));
  }
}
