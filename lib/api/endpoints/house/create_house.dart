import 'dart:convert';

import 'package:my_pet/api/endpoints/base.dart';
import 'package:http/http.dart' as http;
import 'package:my_pet/utils/keycloak.dart';

class CreateHouseRoute {
  CreateHouseRoute();

  Future<dynamic> post(String name) async {
    http.Response response = await BaseRequest(null).post("/api/house/register",
        {"Authorization": "Bearer ${Auth.token}"}, {"name": name});
    return jsonDecode(response.body);
  }
}
