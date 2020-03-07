import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weatherInApp/model/city_list_model_entity.dart';

class SelectCityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SelectCityPageState();
  }
}

class SelectCityPageState extends State<SelectCityPage> {
  CityListModelEntity _cityData;
  int _cityCount = 0;

  @override
  void initState() {
    super.initState();
    _loadLocalJsonData().then((data) {
      // print(data);
      setState(() {
        _cityData = CityListModelEntity().fromJson(jsonDecode(data));
        _cityCount = _cityData.data.length;
      });

      //print(_cityData.data[0].cityZh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择城市"),
      ),
      body: Scrollbar(
        child: ListView.separated(
          itemCount: _cityCount,
          itemBuilder: (BuildContext context, int index) {
            return _buildCityItem(context, index);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      ),
    );
  }

  Future<String> _loadLocalJsonData() async {
    return DefaultAssetBundle.of(context).loadString("json/city.json");
  }

  _buildCityItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        print("tap $index");
        Navigator.pop(context,_cityData.data[index]);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          "${_cityData.data[index].provinceZh}   ${_cityData.data[index].cityZh}",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
