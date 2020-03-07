import 'package:weatherInApp/model/seven_days_model_entity.dart';

sevenDaysModelEntityFromJson(SevenDaysModelEntity data, Map<String, dynamic> json) {
	if (json['cityid'] != null) {
		data.cityid = json['cityid']?.toString();
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
	if (json['data'] != null) {
		data.data = new List<SevenDaysModelData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new SevenDaysModelData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> sevenDaysModelEntityToJson(SevenDaysModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['cityid'] = entity.cityid;
	data['update_time'] = entity.updateTime;
	data['city'] = entity.city;
	data['cityEn'] = entity.cityEn;
	data['country'] = entity.country;
	data['countryEn'] = entity.countryEn;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

sevenDaysModelDataFromJson(SevenDaysModelData data, Map<String, dynamic> json) {
	if (json['day'] != null) {
		data.day = json['day']?.toString();
	}
	if (json['date'] != null) {
		data.date = json['date']?.toString();
	}
	if (json['week'] != null) {
		data.week = json['week']?.toString();
	}
	if (json['wea'] != null) {
		data.wea = json['wea']?.toString();
	}
	if (json['wea_img'] != null) {
		data.weaImg = json['wea_img']?.toString();
	}
	if (json['air'] != null) {
		data.air = json['air']?.toInt();
	}
	if (json['humidity'] != null) {
		data.humidity = json['humidity']?.toInt();
	}
	if (json['air_level'] != null) {
		data.airLevel = json['air_level']?.toString();
	}
	if (json['air_tips'] != null) {
		data.airTips = json['air_tips']?.toString();
	}
	if (json['alarm'] != null) {
		data.alarm = new SevenDaysModelDataAlarm().fromJson(json['alarm']);
	}
	if (json['tem1'] != null) {
		data.tem1 = json['tem1']?.toString();
	}
	if (json['tem2'] != null) {
		data.tem2 = json['tem2']?.toString();
	}
	if (json['tem'] != null) {
		data.tem = json['tem']?.toString();
	}
	if (json['win'] != null) {
		data.win = json['win']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['win_speed'] != null) {
		data.winSpeed = json['win_speed']?.toString();
	}
	if (json['hours'] != null) {
		data.hours = new List<SevenDaysModelDataHour>();
		(json['hours'] as List).forEach((v) {
			data.hours.add(new SevenDaysModelDataHour().fromJson(v));
		});
	}
	if (json['index'] != null) {
		data.index = new List<SevenDaysModelDataIndex>();
		(json['index'] as List).forEach((v) {
			data.index.add(new SevenDaysModelDataIndex().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> sevenDaysModelDataToJson(SevenDaysModelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['day'] = entity.day;
	data['date'] = entity.date;
	data['week'] = entity.week;
	data['wea'] = entity.wea;
	data['wea_img'] = entity.weaImg;
	data['air'] = entity.air;
	data['humidity'] = entity.humidity;
	data['air_level'] = entity.airLevel;
	data['air_tips'] = entity.airTips;
	if (entity.alarm != null) {
		data['alarm'] = entity.alarm.toJson();
	}
	data['tem1'] = entity.tem1;
	data['tem2'] = entity.tem2;
	data['tem'] = entity.tem;
	data['win'] = entity.win;
	data['win_speed'] = entity.winSpeed;
	if (entity.hours != null) {
		data['hours'] =  entity.hours.map((v) => v.toJson()).toList();
	}
	if (entity.index != null) {
		data['index'] =  entity.index.map((v) => v.toJson()).toList();
	}
	return data;
}

sevenDaysModelDataAlarmFromJson(SevenDaysModelDataAlarm data, Map<String, dynamic> json) {
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

Map<String, dynamic> sevenDaysModelDataAlarmToJson(SevenDaysModelDataAlarm entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['alarm_type'] = entity.alarmType;
	data['alarm_level'] = entity.alarmLevel;
	data['alarm_content'] = entity.alarmContent;
	return data;
}

sevenDaysModelDataHourFromJson(SevenDaysModelDataHour data, Map<String, dynamic> json) {
	if (json['day'] != null) {
		data.day = json['day']?.toString();
	}
	if (json['wea'] != null) {
		data.wea = json['wea']?.toString();
	}
	if (json['tem'] != null) {
		data.tem = json['tem']?.toString();
	}
	if (json['win'] != null) {
		data.win = json['win']?.toString();
	}
	if (json['win_speed'] != null) {
		data.winSpeed = json['win_speed']?.toString();
	}
	return data;
}

Map<String, dynamic> sevenDaysModelDataHourToJson(SevenDaysModelDataHour entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['day'] = entity.day;
	data['wea'] = entity.wea;
	data['tem'] = entity.tem;
	data['win'] = entity.win;
	data['win_speed'] = entity.winSpeed;
	return data;
}

sevenDaysModelDataIndexFromJson(SevenDaysModelDataIndex data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['level'] != null) {
		data.level = json['level']?.toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	return data;
}

Map<String, dynamic> sevenDaysModelDataIndexToJson(SevenDaysModelDataIndex entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['level'] = entity.level;
	data['desc'] = entity.desc;
	return data;
}