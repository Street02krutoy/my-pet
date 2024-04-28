import 'dart:convert';

import 'package:my_pet/api/endpoints/base.dart';
import 'package:my_pet/utils/keycloak.dart';
import 'package:http/http.dart' as http;
import 'package:openid_client/openid_client_io.dart';

class CreateFinanceRoute {
  CreateFinanceRoute();

  Future<dynamic> post(String text, String time, int type, double cost) async {
    http.Response response = await BaseRequest(null).post(
        "/api/finance/",
        {"Authorization": "Bearer ${Auth.token}"},
        {"text": text, "date": time, "type": type, "cost": cost});
    return response.body;
  }
}
