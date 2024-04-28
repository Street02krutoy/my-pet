import 'dart:convert';

import 'package:my_pet/api/endpoints/base.dart';
import 'package:http/http.dart' as http;
import 'package:my_pet/utils/keycloak.dart';

class AddPetRoute {
  AddPetRoute();

  Future<dynamic> post(
      String name,
      String birthDate,
      String breed,
      int gender,
      String color,
      double weight,
      double height,
      String houseId,
      String info) async {
    http.Response response = await BaseRequest(null).post("/api/pets", {
      "Authorization": "Bearer ${Auth.token}"
    }, {
      "name": name,
      "birth": birthDate,
      "breed": breed,
      "sex": gender,
      "color": color,
      "weight": weight,
      "height": height,
      "house_id": houseId,
      "info": info,
    });
    return jsonDecode(response.body);
  }
}
