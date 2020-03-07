import 'package:weatherInApp/model/today_weather_model_entity.dart';

todayWeatherModelEntityFromJson(TodayWeatherModelEntity data, Map<String, dynamic> json) {
	if (json['cityid'] != null) {
		data.cityid = json['cityid']?.toString();
	}
	if (json['date'] != null) {
		data.date = json['date']?.toString();
	}
	if (json['week'] != null) {
		data.week = json['week']?.toString();
	}
	if (json['update_time'] != null) {
		data.updateTime = json['update_time']?.toString();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toString();
	}
	if (json['cityEn'] != null) {
		data.cityEn = json['cityEn']?.toString();
	}
	if (json['country'] != null) {
		data.country = json['country']?.toString();
	}
	if (json['countryEn'] != null) {
		data.countryEn = json['countryEn']?.toString();
	}
	if (json['wea'] != null) {
		data.wea = json['wea']?.toString();
	}
	if (json['wea_img'] != null) {
		data.weaImg = json['wea_img']?.toString();
	}
	if (json['tem'] != null) {
		data.tem = json['tem']?.toString();
	}
	if (json['tem1'] != null) {
		data.tem1 = json['tem1']?.toString();
	}
	if (json['tem2'] != null) {
		data.tem2 = json['tem2']?.toString();
	}
	if (json['win'] != null) {
		data.win = json['win']?.toString();
	}
	if (json['win_speed'] != null) {
		data.winSpeed = json['win_speed']?.toString();
	}
	if (json['win_meter'] != null) {
		data.winMeter = json['win_meter']?.toString();
	}
	if (json['humidity'] != null) {
		data.humidity = json['humidity']?.toString();
	}
	if (json['visibility'] != null) {
		data.visibility = json['visibility']?.toString();
	}
	if (json['pressure'] != null) {
		data.pressure = json['pressure']?.toString();
	}
	if (json['air'] != null) {
		data.air = json['air']?.toString();
	}
	if (json['air_pm25'] != null) {
		data.airPm25 = json['air_pm25']?.toString();
	}
	if (json['air_level'] != null) {
		data.airLevel = json['air_level']?.toString();
	}
	if (json['air_tips'] != null) {
		data.airTips = json['air_tips']?.toString();
	}
	if (json['alarm'] != null) {
		data.alarm = new TodayWeatherModelAlarm().fromJson(json['alarm']);
	}
	return data;
}

Map<String, dynamic> todayWeatherModelEntityToJson(TodayWeatherModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['cityid'] = entity.cityid;
	data['date'] = entity.date;
	data['week'] = entity.week;
	data['update_time'] = entity.updateTime;
	data['city'] = entity.city;
	data['cityEn'] = entity.cityEn;
	data['country'] = entity.country;
	data['countryEn'] = entity.countryEn;
	data['wea'] = entity.wea;
	data['wea_img'] = entity.weaImg;
	data['tem'] = entity.tem;
	data['tem1'] = entity.tem1;
	data['tem2'] = entity.tem2;
	data['win'] = entity.win;
	data['win_speed'] = entity.winSpeed;
	data['win_meter'] = entity.winMeter;
	data['humidity'] = entity.humidity;
	data['visibility'] = entity.visibility;
	data['pressure'] = entity.pressure;
	data['air'] = entity.air;
	data['air_pm25'] = entity.airPm25;
	data['air_level'] = entity.airLevel;
	data['air_tips'] = entity.airTips;
	if (entity.alarm != null) {
		data['alarm'] = entity.alarm.toJson();
	}
	return data;
}

todayWeatherModelAlarmFromJson(TodayWeatherModelAlarm data, Map<String, dynamic> json) {
	if (json['alarm_type'] != null) {
		data.alarmType = json['alarm_type']?.toString();
	}
	if (json['alarm_level'] != null) {
		data.alarmLevel = json['alarm_level']?.toString();
	}
	if (json['alarm_content'] != null) {
		data.alarmContent = json['alarm_content']?.toString();
	}
	return data;
}

Map<String, dynamic> todayWeatherModelAlarmToJson(TodayWeatherModelAlarm entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['alarm_type'] = entity.alarmType;
	data['alarm_level'] = entity.alarmLevel;
	data['alarm_content'] = entity.alarmContent;
	return data;
}