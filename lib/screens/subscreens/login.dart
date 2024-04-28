import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_pet/api/endpoints/auth/login.dart';
import 'package:my_pet/screens/subscreens/components/info_box.dart';
import 'package:my_pet/utils/keycloak.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: InfoBox(
          child: Column(
            children: [
              TextFormField(
                onChanged: (text) {},
                decoration: const InputDecoration(
                  hintText: "Phone number",
                ),
                maxLines: 1,
                minLines: 1,
              ),
              TextFormField(
                onChanged: (text) {},
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                maxLines: 1,
                minLines: 1,
              ),
              Spacer(),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Register")),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        LoginRoute()
                            .post("name", "password", "phone")
                            .then((value) {
                          print(Auth.token);
                        });
                        Navigator.pop(context);
                      },
                      child: Text("Login")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
