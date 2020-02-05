import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/hot/hotlist/data/HotMovieData.dart';
import 'package:flutter_douban/hot/hotlist/item/HotMovieItemWidget.dart';
import 'package:http/http.dart' as http;

class HotMoviesListWidget extends StatefulWidget {
  String curCity;

  HotMoviesListWidget(String city) {
    curCity = city;
  }

  @override
  State<StatefulWidget> createState() {
    return HotMoviesListWidgetState();
  }
}

class HotMoviesListWidgetState extends State<HotMoviesListWidget>
    with AutomaticKeepAliveClientMixin {
  List<HotMovieData> hotMovies = List<HotMovieData>();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void didUpdateWidget(HotMoviesListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print(oldWidget.curCity + '------- ' + widget.curCity);
    if(oldWidget.curCity != widget.curCity) {
      setState(() {
        hotMovies = [];
      });
      _getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hotMovies == null || hotMovies.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.separated(
          itemBuilder: (context, index) => HotMovieItemWidget(hotMovies[index]),
          separatorBuilder: (context, index) => Divider(
            height: 1,
            color: Colors.black26,
          ),
          itemCount: hotMovies.length,
        ),
      );
    }
  }

  void _getData() async {
    List<HotMovieData> serverDataList = new List();
    String url =
        'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=' +
            widget.curCity +
            '&start=0&count=10';
    print(url);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        for (dynamic data in responseJson['subjects']) {
          HotMovieData hotMovieData = HotMovieData.fromJson(data);
          serverDataList.add(hotMovieData);
        }
      }
      setState(() {
        hotMovies = serverDataList;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  bool get wantKeepAlive => true;
}
