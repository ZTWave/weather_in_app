import 'package:weatherInApp/generated/json/base/json_convert_content.dart';

class CityListModelEntity with JsonConvert<CityListModelEntity> {
	List<CityListModelData> data;
}

class CityListModelData with JsonConvert<CityListModelData> {
	String id;
	String cityEn;
	String cityZh;
	String provinceEn;
	String provinceZh;
	String leaderEn;
	String leaderZh;
	String lat;
	String lon;
}
