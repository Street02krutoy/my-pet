import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class BaseRequest<T> {
  BaseRequest(this.encoding);
  final Encoding? encoding;

  static http.Client client = http.Client();

  Future<http.Response> get(
    String url,
    Map<String, String> headers,
  ) async {
    headers.putIfAbsent("Content-Type", () => "application/json");

    http.Response res = await client.get(
      Uri.parse(dotenv.get("BASE_URL") + url),
      headers: headers,
    );
    print(headers);
    return res;
  }

  Future<http.Response> post(
    String url,
    Map<String, String> headers,
    Object body,
  ) async {
    headers.putIfAbsent("Content-Type", () => "application/json");
    http.Response res = await client.post(
        Uri.parse(dotenv.get("BASE_URL") + url),
        body: jsonEncode(body),
        headers: headers,
        encoding: encoding);
    return res;
  }

  Future<http.Response> put(
    String url,
    Map<String, String> headers,
    Object body,
  ) async {
    headers.putIfAbsent("Content-Type", () => "application/json");

    http.Response res = await client.put(
        Uri.parse(dotenv.get("BASE_URL") + url),
        body: jsonEncode(body),
        headers: headers,
        encoding: encoding);
    return res;
  }

  Future<http.Response> delete(
    String url,
    Map<String, String> headers,
    Object body,
  ) async {
    headers.putIfAbsent("Content-Type", () => "application/json");

    http.Response res = await client.delete(
        Uri.parse(dotenv.get("BASE_URL") + url),
        body: jsonEncode(body),
        headers: headers,
        encoding: encoding);
    return res;
  }
}
