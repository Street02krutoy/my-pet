import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Keycloak {
  static Widget loginButton = IconButton(
      onPressed: () {
        Keycloak.authenticate();
      },
      icon: const Icon(Icons.login_sharp));

  static Future<void> authenticate(
      {List<String> scopes = const ['openid']}) async {
    // create the client
    var issuer = await Issuer.discover(
        Uri.parse(dotenv.get("SSO_URL", fallback: "https://example.com")));
    var client = Client(issuer, dotenv.get("CLIENT_ID", fallback: "login-app"));

    // create a function to open a browser with an url
    urlLauncher(String url) async {
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    // create an authenticator
    var authenticator = new Authenticator(client,
        scopes: scopes, port: 4000, urlLancher: urlLauncher);

    // starts the authentication
    var c = await authenticator.authorize();

    // close the webview when finished
    closeInAppWebView();

    Auth.set(await c.getUserInfo());
  }
}

class Auth {
  static UserInfo user = UserInfo.fromJson({});

  static void set(UserInfo userInfo) {
    user = userInfo;
  }
}
