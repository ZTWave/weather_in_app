import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weatherInApp/model/seven_days_model_entity.dart';
import 'package:weatherInApp/net/net_base.dart';
import 'package:weatherInApp/page/home_page.dart';
import 'package:weatherInApp/page/select_city_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WeatherInApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'WeatherIn'),
        routes: <String, WidgetBuilder>{
          '/page/selectCity': (_) => SelectCityPage(),
          '/pgae/home': (_) => MyHomePage(),
        },
    );
  }
}

