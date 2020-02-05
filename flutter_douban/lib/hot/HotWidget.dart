import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/hot/hotlist/HotMoviesListWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotWidgetState();
  }
}

class HotWidgetState extends State<HotWidget> {
  String curCity;

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    if (curCity != null && curCity.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 80.0,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    curCity,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onTap: () {
                    _jumpToCitiesWidget();
                  },
                ),
                Icon(Icons.arrow_drop_down),
                Expanded(
                  flex: 1,
                  child: TextField(
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      hintText: '\uE8b6 电影 / 电视剧 / 影人',
                      hintStyle: TextStyle(
                        fontFamily: 'MaterialIcons',
                        fontSize: 16.0,
                      ),
                      filled: true,
                      fillColor: Colors.black12,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.expand(height: 50.0),
                    child: TabBar(
                      unselectedLabelColor: Colors.black12,
                      labelColor: Colors.black87,
                      indicatorColor: Colors.black87,
                      tabs: <Widget>[
                        Tab(
                          text: '正在热映',
                        ),
                        Tab(
                          text: '即将上映',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(
                        children: <Widget>[
                          HotMoviesListWidget(curCity),
                          Center(
                            child: Text('即将上映'),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  void _jumpToCitiesWidget() async {
    var selectedCity =
        await Navigator.pushNamed(context, '/Cities', arguments: curCity);
    if (selectedCity == null) return;

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('curCity', selectedCity);

    setState(() {
      curCity = selectedCity;
    });
  }

  void initData() async {
    final prefs = await SharedPreferences.getInstance();
    String city = prefs.getString('curCity');
    if (city != null && city.isNotEmpty) {
      setState(() {
        curCity = city;
      });
    } else {
      setState(() {
        curCity = '北京';
      });
    }
  }
}
