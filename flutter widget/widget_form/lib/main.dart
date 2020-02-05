import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormWidgetState();
  }
}

/// 创建 Form，并为其添加 GlobalKey。
/// 在 Form 里添加表单元素，并给表单元素添加校验逻辑。
/// 添加一个按钮去提交并验证表单，提交并验证表单需要用到 Form 的 FormState 方法，Form 是 StatefulWidget，FormState 是 Form 的状态。
class FormWidgetState extends State<MyApp> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String _userGender = '男';
  String _userName;
  String _userPassword;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter Form",
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("widget form"),
        ),
        body: Form(
            key: _globalKey,
            child: Column(
              children: <Widget>[
                DropdownButtonFormField(
                  value: _userGender,
                  items: ['男', '女']
                      .map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _userGender = value;
                    });
                  },
                  onSaved: (value) {
                    _userGender = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: '用户名'),
                  validator: (value) {
                    if (value?.length <= 5) {
                      return '用户名必须大于 5 个字符';
                    }
                  },
                  onSaved: (value) {
                    _userName = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: '密码'),
                  obscureText: true,
                  validator: (value) {
                    if (value?.length <= 8) {
                      return '密码必须大于 5 个字符';
                    }
                  },
                  onSaved: (value) {
                    _userPassword = value;
                  },
                ),
                RaisedButton(
                  child: Text('注册'),
                  onPressed: () {
                    if(_globalKey.currentState.validate()){
                      _globalKey.currentState.save();
                      print(_userGender);
                      print(_userName);
                      print(_userPassword);
                      print(_globalKey);
                    }
                  },
                )
              ],
            )),
      ),
    );
  }
}
