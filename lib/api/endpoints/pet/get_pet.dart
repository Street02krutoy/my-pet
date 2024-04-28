import 'dart:convert';

import 'package:my_pet/api/endpoints/base.dart';
import 'package:http/http.dart' as http;
import 'package:my_pet/utils/keycloak.dart';

class GetPetRoute {
  GetPetRoute();

  Future<dynamic> get(String id) async {
    http.Response response = await BaseRequest(null)
        .get("/api/pet/$id", {"Authorization": "Bearer ${Auth.token}"});
    return jsonDecode(response.body);
  }
}
