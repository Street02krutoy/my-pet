import 'dart:convert';

import 'package:my_pet/api/endpoints/base.dart';
import 'package:http/http.dart' as http;
import 'package:my_pet/utils/keycloak.dart';

class AddNoteRoute {
  AddNoteRoute();

  Future<dynamic> put(
      String id, double weight, double height, String? note) async {
    http.Response response = await BaseRequest(null).put(
        "/api/pet/$id",
        {"Authorization": "Bearer ${Auth.token}"},
        {"weight": weight, "height": height, "note": note});
    return jsonDecode(response.body);
  }
}
