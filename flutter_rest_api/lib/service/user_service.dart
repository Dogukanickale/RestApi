import 'dart:convert';

import 'package:flutter_rest_api/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String url = "https://reqres.in/api/users?page=2";
  Future<userModel?> fetchusers() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonBody = userModel.fromJson(
          jsonDecode(res.body)); // gelen parametreleri jsonboyd e attın
      return jsonBody;
    } else {
      print("İstek başarısız => ${res.statusCode}");
    }
  }
}
