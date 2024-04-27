// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_pet/classes/pet_class.dart';
import 'package:my_pet/screens/subscreens/home_screen.dart';
import 'package:my_pet/screens/subscreens/pet_creating.dart';
import 'package:my_pet/services/house_user_service.dart';
import 'package:my_pet/utils/AnimalType.dart';

import '../utils/keycloak.dart';

class HousePage extends StatefulWidget {
  const HousePage({super.key});

  @override
  State<HousePage> createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  callback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return true
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: const Text("Дома"),
              actions: [
                IconButton(
                    onPressed: () {
                      HomeUserService(context).showUserDialog(controller.index);
                    },
                    icon: Icon(Icons.list_alt)),
                Keycloak.loginButton
              ],
              bottom: TabBar(controller: controller, tabs: const [
                Tab(
                  text: "house0",
                ),
                Tab(
                  text: "house1",
                ),
                Tab(
                  text: "house2",
                )
              ]),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PetCreatePage(
                          title: "Добавить питомца",
                          pet: Pet("", AnimalType.noExist),
                          callbackParent: callback,
                          callbackMain: callback)),
                );
              },
              child: const Icon(Icons.add),
            ),
            body: TabBarView(
              controller: controller,
              children: [
                HouseScreen(
                  index: 0,
                ),
                HouseScreen(
                  index: 1,
                ),
                HouseScreen(
                  index: 2,
                )
              ],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: const Text("Дома"),
              actions: [Keycloak.loginButton],
            ),
            body: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("создать дом"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("присоединиться к дому"),
                  ),
                ],
              ),
            ),
          );
  }
}
