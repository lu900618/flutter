import 'package:flutter/material.dart';

void main() => runApp(ShowPersistentBottomSheetWidget());

class ShowPersistentBottomSheetWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('widget bottomSheet'),
        ),
        body: Builder(
          builder: (context) => RaisedButton(
            onPressed: () {
//              showBottomSheet(
//                  context: context,
//                  builder: (context) => BottomSheet(
//                      onClosing: () {},
//                      builder: (context) => Container(
//                            height: 200.0,
//                            color: Colors.blue,
//                            child: Center(
//                              child: RaisedButton(
//                                onPressed: () {
//                                  Navigator.of(context).pop();
//                                },
//                                child: Text('dimiss'),
//                              ),
//                            ),
//                          )));

              showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomSheet(
                        onClosing: () {},
                        builder: (context) => Container(
                          height: 200.0,
                          color: Colors.blue,
                          child: Center(
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('dimiss'),
                            ),
                          ),
                        ),
                      ));
            },
            child: Text('show bottomSheet'),
          ),
        ),
      ),
    );
  }
}
