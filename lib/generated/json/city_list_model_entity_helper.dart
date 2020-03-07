import 'package:weatherInApp/model/city_list_model_entity.dart';

cityListModelEntityFromJson(CityListModelEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new List<CityListModelData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new CityListModelData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> cityListModelEntityToJson(CityListModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

cityListModelDataFromJson(CityListModelData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['cityEn'] != null) {
		data.cityEn = json['cityEn']?.toString();
	}
	if (json['cityZh'] != null) {
		data.cityZh = json['cityZh']?.toString();
	}
	if (json['provinceEn'] != null) {
		data.provinceEn = json['provinceEn']?.toString();
	}
	if (json['provinceZh'] != null) {
		data.provinceZh = json['provinceZh']?.toString();
	}
	if (json['leaderEn'] != null) {
		data.leaderEn = json['leaderEn']?.toString();
	}
	if (json['leaderZh'] != null) {
		data.leaderZh = json['leaderZh']?.toString();
	}
	if (json['lat'] != null) {
		data.lat = json['lat']?.toString();
	}
	if (json['lon'] != null) {
		data.lon = json['lon']?.toString();
	}
	return data;
}

Map<String, dynamic> cityListModelDataToJson(CityListModelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['cityEn'] = entity.cityEn;
	data['cityZh'] = entity.cityZh;
	data['provinceEn'] = entity.provinceEn;
	data['provinceZh'] = entity.provinceZh;
	data['leaderEn'] = entity.leaderEn;
	data['leaderZh'] = entity.leaderZh;
	data['lat'] = entity.lat;
	data['lon'] = entity.lon;
	return data;
}