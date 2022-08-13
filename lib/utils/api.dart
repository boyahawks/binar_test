import 'dart:convert';
import 'package:http/http.dart';

class Api {
  static var basicUrl = "https://fakestoreapi.com/";

  static Future connectionApi(
      String typeConnect, valFormData, String url) async {
    var getUrl = basicUrl + url;
    if (typeConnect == "post") {
      final url = Uri.parse(getUrl);
      final response = await post(url, body: valFormData);
      return response;
    } else {
      final url = Uri.parse(getUrl);
      final response = await get(url);
      return response;
    }
  }
}
