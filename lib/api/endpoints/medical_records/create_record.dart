import 'dart:convert';

import 'package:my_pet/api/endpoints/base.dart';
import 'package:my_pet/utils/keycloak.dart';
import 'package:http/http.dart' as http;
import 'package:openid_client/openid_client_io.dart';

class CreateRecordRoute {
  CreateRecordRoute();

  Future<void> post(String id, String note, DateTime date, String petId) async {
    http.Response response = await BaseRequest(null).post(
        "/api/medcard/$id",
        {"Authorization": "Bearer ${Auth.token}"},
        {"note": note, "date": date, "pet_id": petId});
    Auth.set(jsonDecode(response.body)["token"]);
  }
}
