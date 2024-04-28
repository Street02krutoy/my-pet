import 'package:flutter/material.dart';
import 'package:my_pet/api/endpoints/auth/login.dart';
import 'package:my_pet/api/endpoints/auth/register.dart';
import 'package:my_pet/api/endpoints/finance/create_finance.dart';
import 'package:my_pet/api/endpoints/finance/get_finances.dart';
import 'package:my_pet/api/endpoints/finance/remove_finance.dart';
import 'package:my_pet/api/endpoints/house/create_house.dart';
import 'package:my_pet/api/endpoints/house/get_all_houses.dart';
import 'package:my_pet/api/endpoints/house/get_houses.dart';
import 'package:my_pet/api/endpoints/house/join_house.dart';
import 'package:my_pet/api/endpoints/pet/add_pet.dart';
import 'package:my_pet/api/endpoints/pet/add_pet_note.dart';
import 'package:my_pet/api/endpoints/pet/get_pet.dart';
import 'package:my_pet/utils/keycloak.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("text"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("shit that works"),
            TextButton(
                onPressed: () {
                  LoginRoute().post("name", "password", "phone").then((value) {
                    print(Auth.token);
                  });
                },
                child: Text("login")),
            TextButton(
                onPressed: () {
                  RegisterRoute()
                      .post("name", "password", "phone")
                      .then((value) {
                    print(Auth.token);
                  });
                },
                child: Text("reg")),
            TextButton(
                onPressed: () {
                  CreateHouseRoute().post("name").then((value) {
                    print(value);
                  });
                },
                child: Text("create house")),
            TextButton(
                onPressed: () {
                  JoinHouseRoute().post("5CtCX)|p&kjwZ_").then((value) {
                    print(value);
                  });
                },
                child: Text("join house")),
            TextButton(
                onPressed: () {
                  GetHousesRoute().get().then((value) {
                    print(value);
                  });
                },
                child: Text("get all")),
            TextButton(
                onPressed: () {
                  AddNoteRoute().put("1", 10, 10, "note").then((value) {
                    print(value);
                  });
                },
                child: Text("create-pet note")),
            TextButton(
                onPressed: () {
                  AddPetRoute()
                      .post("name", "2020-01-01", "breed", 1, "color", 10, 10,
                          "1", "info")
                      .then((value) {
                    print(value);
                  });
                },
                child: Text("create pet")),
            TextButton(
                onPressed: () {
                  GetPetRoute().get("1").then((value) {
                    print(value);
                  });
                },
                child: Text("get pet")),
            TextButton(
                onPressed: () {
                  GetHouseRoute().get("1").then((value) {
                    print(value);
                  });
                },
                child: Text("get 1")),
            Text("shit thatnot work"),
            TextButton(
                onPressed: () {
                  RemoveFinanceRoute().delete("0").then((value) {
                    print(value.toString());
                  });
                },
                child: Text("del finance rec")),
            TextButton(
                onPressed: () {
                  CreateFinanceRoute()
                      .post("2020-01-01", "2020-01-01", 1, 10)
                      .then((value) {
                    print(value);
                  });
                },
                child: Text("add finance rec")),
            TextButton(
                onPressed: () {
                  GetFinancesRoute().get().then((value) {
                    print(value.toString());
                  });
                },
                child: Text("get finance recs")),
          ],
        ),
      ),
    );
  }
}
