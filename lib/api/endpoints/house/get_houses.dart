import 'dart:convert';

import 'package:my_pet/api/endpoints/base.dart';
import 'package:my_pet/utils/keycloak.dart';
import 'package:http/http.dart' as http;
import 'package:openid_client/openid_client_io.dart';

class GetHouseRoute {
  GetHouseRoute();

  Future<dynamic> get(String id) async {
    http.Response response = await BaseRequest(null)
        .get("/api/house/$id", {"Authorization": "Bearer ${Auth.token}"});
    return jsonDecode(response.body);
  }
}
