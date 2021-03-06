// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:weatherInApp/generated/json/city_list_model_entity_helper.dart';
import 'package:weatherInApp/generated/json/seven_days_model_entity_helper.dart';
import 'package:weatherInApp/generated/json/today_weather_model_entity_helper.dart';
import 'package:weatherInApp/model/city_list_model_entity.dart';
import 'package:weatherInApp/model/seven_days_model_entity.dart';
import 'package:weatherInApp/model/today_weather_model_entity.dart';

class JsonConvert<T> {
  T fromJson(Map<String, dynamic> json) {
    return _getFromJson<T>(runtimeType, this, json);
  }

  Map<String, dynamic> toJson() {
    return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
      case SevenDaysModelEntity:
        return sevenDaysModelEntityFromJson(data as SevenDaysModelEntity, json)
            as T;
      case SevenDaysModelData:
        return sevenDaysModelDataFromJson(data as SevenDaysModelData, json)
            as T;
      case SevenDaysModelDataAlarm:
        return sevenDaysModelDataAlarmFromJson(
            data as SevenDaysModelDataAlarm, json) as T;
      case SevenDaysModelDataHour:
        return sevenDaysModelDataHourFromJson(
            data as SevenDaysModelDataHour, json) as T;
      case SevenDaysModelDataIndex:
        return sevenDaysModelDataIndexFromJson(
            data as SevenDaysModelDataIndex, json) as T;
      case TodayWeatherModelEntity:
        return todayWeatherModelEntityFromJson(
            data as TodayWeatherModelEntity, json) as T;
      case TodayWeatherModelAlarm:
        return todayWeatherModelAlarmFromJson(
            data as TodayWeatherModelAlarm, json) as T;
      case CityListModelEntity:
        return cityListModelEntityFromJson(data as CityListModelEntity, json)
            as T;
      case CityListModelData:
        return cityListModelDataFromJson(data as CityListModelData, json) as T;
    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
    switch (type) {
      case SevenDaysModelEntity:
        return sevenDaysModelEntityToJson(data as SevenDaysModelEntity);
      case SevenDaysModelData:
        return sevenDaysModelDataToJson(data as SevenDaysModelData);
      case SevenDaysModelDataAlarm:
        return sevenDaysModelDataAlarmToJson(data as SevenDaysModelDataAlarm);
      case SevenDaysModelDataHour:
        return sevenDaysModelDataHourToJson(data as SevenDaysModelDataHour);
      case SevenDaysModelDataIndex:
        return sevenDaysModelDataIndexToJson(data as SevenDaysModelDataIndex);
      case TodayWeatherModelEntity:
        return todayWeatherModelEntityToJson(data as TodayWeatherModelEntity);
      case TodayWeatherModelAlarm:
        return todayWeatherModelAlarmToJson(data as TodayWeatherModelAlarm);
      case CityListModelEntity:
        return cityListModelEntityToJson(data as CityListModelEntity);
      case CityListModelData:
        return cityListModelDataToJson(data as CityListModelData);
    }
    return data as T;
  }

  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {
      case 'SevenDaysModelEntity':
        return SevenDaysModelEntity().fromJson(json);
      case 'SevenDaysModelData':
        return SevenDaysModelData().fromJson(json);
      case 'SevenDaysModelDataAlarm':
        return SevenDaysModelDataAlarm().fromJson(json);
      case 'SevenDaysModelDataHour':
        return SevenDaysModelDataHour().fromJson(json);
      case 'SevenDaysModelDataIndex':
        return SevenDaysModelDataIndex().fromJson(json);
      case 'TodayWeatherModelEntity':
        return TodayWeatherModelEntity().fromJson(json);
      case 'TodayWeatherModelAlarm':
        return TodayWeatherModelAlarm().fromJson(json);
      case 'CityListModelEntity':
        return CityListModelEntity().fromJson(json);
      case 'CityListModelData':
        return CityListModelData().fromJson(json);
    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {
      case 'SevenDaysModelEntity':
        return List<SevenDaysModelEntity>();
      case 'SevenDaysModelData':
        return List<SevenDaysModelData>();
      case 'SevenDaysModelDataAlarm':
        return List<SevenDaysModelDataAlarm>();
      case 'SevenDaysModelDataHour':
        return List<SevenDaysModelDataHour>();
      case 'SevenDaysModelDataIndex':
        return List<SevenDaysModelDataIndex>();
      case 'TodayWeatherModelEntity':
        return List<TodayWeatherModelEntity>();
      case 'TodayWeatherModelAlarm':
        return List<TodayWeatherModelAlarm>();
      case 'CityListModelEntity':
        return List<CityListModelEntity>();
      case 'CityListModelData':
        return List<CityListModelData>();
    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}
