import 'dart:convert';
import 'dart:io';

class NetBase {
  //控制台网址        https://www.tianqiapi.com/

  //请求天气url
  static const String BaseTodayUrl =
      "https://tianqiapi.com/api?version=v6&appid=87517498&appsecret=AMlcb94Y";

  static const String BaseSevenDaysUrl =
      "https://www.tianqiapi.com/api?version=v1&appid=87517498&appsecret=AMlcb94Y";

  static Future<String> getSevenDaysData(String _cityId) async {

    String url =BaseSevenDaysUrl;
    if(_cityId !=""){
      url +="&cityid=$_cityId";
    }

    print("url _> $url");

    HttpClient client = HttpClient();
    HttpClientRequest request =
        await client.getUrl(Uri.parse(url));
    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();
    client.close();
    return responseBody;
  }
}
