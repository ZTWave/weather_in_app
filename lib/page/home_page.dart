import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherInApp/model/city_list_model_entity.dart';
import 'package:weatherInApp/model/seven_days_model_entity.dart';
import 'package:weatherInApp/net/net_base.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _days = 0;
  String _location = "北京";
  String _temperature = "";
  bool _isLoading = false;
  bool _loadingFinish = false;

  String _cityId = "";

  String _backgroundImage = "images/background/qing.jpg";

  SevenDaysModelEntity _sevenDaysModelEntity = SevenDaysModelEntity();

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
      _loadingFinish = false;
    });
    _getNetData(_cityId).then((d) => {_getDataSuccess(d)});
  }

  _getDataSuccess(String data) {
    setState(() {
      if (null != data) {
        _sevenDaysModelEntity =
            SevenDaysModelEntity().fromJson(jsonDecode(data));

        _isLoading = false;
        _loadingFinish = true;
        _counter = _sevenDaysModelEntity.data[0].hours.length;
        _temperature = _sevenDaysModelEntity.data[0].tem;
        _location = _sevenDaysModelEntity.city;
        _days = _sevenDaysModelEntity.data.length;

        _backgroundImage =
            _getCorrespondingBackgroundImage(_sevenDaysModelEntity.data[0].wea);
      }
    });
    print(_sevenDaysModelEntity.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.title),
      ),*/
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          _backgroundImage,
          fit: BoxFit.fill,
          height: window.physicalSize.height,
        ),
        BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: new Container(
            color: Colors.white.withOpacity(0.1),
          ),
        ),
        Container(
          /*decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_backgroundImage),
                fit: BoxFit.cover,
              )),*/
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      MaterialButton(
                        child: Row(children: <Widget>[
                          Icon(Icons.location_on),
                          Text("选择城市")
                        ]),
                        onPressed: () async {
                          var result = await Navigator.pushNamed(
                              context, "/page/selectCity");

                          // if (result != null &&
                          //     result.runtimeType == CityListModelEntity) {
                          //   print(result);
                          // }
                          print("result  ->  $result");
                          if (result is CityListModelData) {
                            print(result);
                            setState(() {
                              _cityId = result.id;

                              _isLoading = true;
                              _loadingFinish = false;

                              _getNetData(_cityId)
                                  .then((d) => {_getDataSuccess(d)});
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  _buildTopLoadingBar(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _location,
                          style: TextStyle(fontSize: 18),
                        ),
                        /*Icon(
                          Icons.location_on,
                          color: Colors.grey.shade600,
                        )*/
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _temperature,
                      style: const TextStyle(
                          fontSize: 90,
                          color: Colors.black,
                          fontFamily: "BuidThin"),
                    ),
                  ),
                  _buildMinMaxTemperature(),
                  Container(
                    height: 140,
                    padding: EdgeInsets.all(8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _counter,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildHourItem(index);
                      },
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    //禁止滑动
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return _buildDayItem(index);
                    },
                    itemCount: _days,
                  ),
                  _buildExtraInfo()
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  _buildMinMaxTemperature() {
    if (_loadingFinish) {
      return Column(
        children: <Widget>[
          Text("${_sevenDaysModelEntity.data[0]?.wea}"),
          Text(
              "${_sevenDaysModelEntity.data[0]?.tem1}\/${_sevenDaysModelEntity.data[0]?.tem2}"),
        ],
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(0.0),
      );
    }
  }

  _buildHourItem(int position) {
    String _imagePath;
    SevenDaysModelDataHour _hourItem =
        _sevenDaysModelEntity.data[0].hours[position];
    _imagePath = _getCorrespondingImage(_hourItem.wea);
    return Container(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Center(
        child: Column(
          children: <Widget>[
            Image.asset(_imagePath),
            Text(
              _hourItem.wea,
              textAlign: TextAlign.center,
            ),
            Text(
              _hourItem.tem,
              textAlign: TextAlign.center,
            ),
            Text(
              _hourItem.day,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  _buildDayItem(int position) {
    return Container(
      height: 50,
      padding: EdgeInsets.fromLTRB(32, 8, 32, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            _sevenDaysModelEntity.data[position].day,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                _sevenDaysModelEntity.data[position].wea,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            _sevenDaysModelEntity.data[position].tem,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  _buildTopLoadingBar() {
    if (_isLoading) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox.fromSize(
            size: Size.fromRadius(10),
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
          Padding(
            child: Text(
              "loading",
              style: TextStyle(color: Colors.grey),
            ),
            padding: EdgeInsets.all(8),
          )
        ],
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(0.0),
      );
    }
  }

  _getCorrespondingImage(String chineseWeather) {
    String _imagePath = "";
    switch (chineseWeather) {
      case "晴":
        _imagePath = "images/weather/qing.png";
        break;
      case "雨":
        _imagePath = "images/weather/yu.png";
        break;
      case "雪":
        _imagePath = "images/weather/xue.png";
        break;
      case "雷":
        _imagePath = "images/weather/lei.png";
        break;
      case "沙尘":
        _imagePath = "images/weather/shachen.png";
        break;
      case "雾":
        _imagePath = "images/weather/wu.png";
        break;
      case "冰雹":
        _imagePath = "images/weather/bingbao.png";
        break;
      case "云":
        _imagePath = "images/weather/duoyun.png";
        break;
      case "阴":
        _imagePath = "images/weather/yin.png";
        break;
      default:
        _imagePath = "images/weather/qing.png";
    }
    return _imagePath;
  }

  _getCorrespondingBackgroundImage(String chineseWeather) {
    String _imagePath = "";
    switch (chineseWeather) {
      case "晴":
        _imagePath = "images/background/qing.jpg";
        break;
      case "雨":
        _imagePath = "images/background/yu.jpg";
        break;
      case "小雨":
        _imagePath = "images/background/yu.jpg";
        break;
      case "雪":
        _imagePath = "images/background/xue.jpg";
        break;
      case "雷":
        _imagePath = "images/background/yu.jpg";
        break;
      case "沙尘":
        _imagePath = "images/background/qing.jpg";
        break;
      case "雾":
        _imagePath = "images/background/wu.jpg";
        break;
      case "冰雹":
        _imagePath = "images/background/bingbao.jpg";
        break;
      case "云":
        _imagePath = "images/background/duoyun.jpg";
        break;
      case "阴":
        _imagePath = "images/background/duoyun.jpg";
        break;
      default:
        _imagePath = "images/background/qing.jpg";
    }
    return _imagePath;
  }

  //获取天气数据
  Future<String> _getNetData(String _cityId) async {
    String data = await NetBase.getSevenDaysData(_cityId);
    /*SevenDaysModelEntity entity =
        SevenDaysModelEntity().fromJson(jsonDecode(data));*/
    //print(entity.city);
    return data;
  }

  _buildExtraInfo() {
    if (_loadingFinish) {
      var _itemArray = _sevenDaysModelEntity.data[0].index;
      return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _itemArray.length,
          itemBuilder: (BuildContext buildContext, int index) {
            if (_itemArray[index].level == null) {
              return Container(
                  padding: EdgeInsets.all(16),
                  child: Text(_itemArray[index].desc));
            } else {
              return Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(_itemArray[index].title),
                    Text("等级：" + _itemArray[index].level),
                    Text(_itemArray[index].desc),
                  ],
                ),
              );
            }
          });
    } else {
      return Padding(
        padding: EdgeInsets.all(0.0),
      );
    }
  }
}
