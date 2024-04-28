import 'dart:convert';

import 'package:my_pet/api/endpoints/base.dart';
import 'package:http/http.dart' as http;
import 'package:my_pet/utils/keycloak.dart';

class GetClinicsRoute {
  GetClinicsRoute();

  Future<dynamic> get() async {
    http.Response response =
        await BaseRequest(null).get("/api/vet_clinics", {});
    return jsonDecode(response.body);
  }
}
