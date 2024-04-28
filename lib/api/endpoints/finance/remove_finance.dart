import 'dart:convert';

import 'package:my_pet/api/endpoints/base.dart';
import 'package:my_pet/utils/keycloak.dart';
import 'package:http/http.dart' as http;
import 'package:openid_client/openid_client_io.dart';

class RemoveFinanceRoute {
  RemoveFinanceRoute();

  Future<dynamic> delete(String id) async {
    http.Response response = await BaseRequest(null).delete(
        "/api/reminder/$id", {"Authorization": "Bearer ${Auth.token}"}, {});
    return jsonDecode(response.body);
  }
}
