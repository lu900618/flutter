import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter demo'),
          ),
          body: PopupMenuButton<MenuItem>(
            child: Text('more'),
            onSelected: (MenuItem result) {
              print('click ' + result.toString());
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
              const PopupMenuItem(
                child: Text('menu A'),
                value: MenuItem.menuA,
              ),
              const PopupMenuItem(
                child: Text('menu B'),
                value: MenuItem.menuB,
              ),
              const PopupMenuItem(
                child: Text('menu C'),
                value: MenuItem.menuC,
              ),
              const PopupMenuItem(
                child: Text('menu D'),
                value: MenuItem.menuD,
              ),
            ],
          ),
        ),
      );
}

enum MenuItem { menuA, menuB, menuC, menuD }
