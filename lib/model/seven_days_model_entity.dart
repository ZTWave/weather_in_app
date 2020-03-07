import 'package:weatherInApp/generated/json/base/json_convert_content.dart';
import 'package:weatherInApp/generated/json/base/json_filed.dart';

class SevenDaysModelEntity with JsonConvert<SevenDaysModelEntity> {
	String cityid;
	@JSONField(name: "update_time")
	String updateTime;
	String city;
	String cityEn;
	String country;
	String countryEn;
	List<SevenDaysModelData> data;
}

class SevenDaysModelData with JsonConvert<SevenDaysModelData> {
	String day;
	String date;
	String week;
	String wea;
	@JSONField(name: "wea_img")
	String weaImg;
	int air;
	int humidity;
	@JSONField(name: "air_level")
	String airLevel;
	@JSONField(name: "air_tips")
	String airTips;
	SevenDaysModelDataAlarm alarm;
	String tem1;
	String tem2;
	String tem;
	List<String> win;
	@JSONField(name: "win_speed")
	String winSpeed;
	List<SevenDaysModelDataHour> hours;
	List<SevenDaysModelDataIndex> index;
}

class SevenDaysModelDataAlarm with JsonConvert<SevenDaysModelDataAlarm> {
	@JSONField(name: "alarm_type")
	String alarmType;
	@JSONField(name: "alarm_level")
	String alarmLevel;
	@JSONField(name: "alarm_content")
	String alarmContent;
}

class SevenDaysModelDataHour with JsonConvert<SevenDaysModelDataHour> {
	String day;
	String wea;
	String tem;
	String win;
	@JSONField(name: "win_speed")
	String winSpeed;
}

class SevenDaysModelDataIndex with JsonConvert<SevenDaysModelDataIndex> {
	String title;
	String level;
	String desc;
}
