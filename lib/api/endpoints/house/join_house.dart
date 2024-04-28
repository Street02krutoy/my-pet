import 'dart:convert';

import 'package:my_pet/api/endpoints/base.dart';
import 'package:http/http.dart' as http;
import 'package:my_pet/utils/keycloak.dart';

class JoinHouseRoute {
  JoinHouseRoute();

  Future<dynamic> post(String code) async {
    http.Response response = await BaseRequest(null).post("/api/house/login",
        {"Authorization": "Bearer ${Auth.token}"}, {"access_code": code});
    return jsonDecode(response.body);
  }
}
