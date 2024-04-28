import 'dart:convert';

import 'package:my_pet/api/endpoints/base.dart';
import 'package:my_pet/utils/keycloak.dart';
import 'package:http/http.dart' as http;
import 'package:openid_client/openid_client_io.dart';

class RegisterRoute {
  RegisterRoute();

  Future<void> post(String name, String password, String phone) async {
    http.Response response = await BaseRequest(null).post("/api/register/user",
        {}, {"name": name, "password": password, "phone": phone});
    if (response.statusCode != 200) return;
    Auth.set(jsonDecode(response.body)["token"]);
  }
}
