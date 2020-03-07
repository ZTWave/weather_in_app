import 'package:weatherInApp/generated/json/base/json_convert_content.dart';
import 'package:weatherInApp/generated/json/base/json_filed.dart';

class TodayWeatherModelEntity with JsonConvert<TodayWeatherModelEntity> {
	String cityid;
	String date;
	String week;
	@JSONField(name: "update_time")
	String updateTime;
	String city;
	String cityEn;
	String country;
	String countryEn;
	String wea;
	@JSONField(name: "wea_img")
	String weaImg;
	String tem;
	String tem1;
	String tem2;
	String win;
	@JSONField(name: "win_speed")
	String winSpeed;
	@JSONField(name: "win_meter")
	String winMeter;
	String humidity;
	String visibility;
	String pressure;
	String air;
	@JSONField(name: "air_pm25")
	String airPm25;
	@JSONField(name: "air_level")
	String airLevel;
	@JSONField(name: "air_tips")
	String airTips;
	TodayWeatherModelAlarm alarm;
}

class TodayWeatherModelAlarm with JsonConvert<TodayWeatherModelAlarm> {
	@JSONField(name: "alarm_type")
	String alarmType;
	@JSONField(name: "alarm_level")
	String alarmLevel;
	@JSONField(name: "alarm_content")
	String alarmContent;
}
