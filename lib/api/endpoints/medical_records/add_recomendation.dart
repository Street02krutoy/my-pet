import 'dart:convert';

import 'package:my_pet/api/endpoints/base.dart';
import 'package:my_pet/utils/keycloak.dart';
import 'package:http/http.dart' as http;
import 'package:openid_client/openid_client_io.dart';

class AddRecomRoute {
  AddRecomRoute();

  Future<void> post(String id, String recomendation, String phone) async {
    http.Response response = await BaseRequest(null).post(
        "/api/medcard/$id",
        {"Authorization": "Bearer ${Auth.token}"},
        {"recomendation": recomendation});
    Auth.set(jsonDecode(response.body)["token"]);
  }
}
