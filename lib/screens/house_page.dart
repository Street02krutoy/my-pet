// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_pet/api/endpoints/house/get_all_houses.dart';
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

  Future<dynamic> _future = Future(() => null);

  @override
  Widget build(BuildContext context) {
    _future = GetHousesRoute().get();
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.data != null
            ? _HouseTab(
                house: snapshot.data,
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  title: Text("loading..."),
                ),
              );
      },
    );
  }
}

class _HouseTab extends StatefulWidget {
  const _HouseTab({super.key, required this.house});
  final dynamic house;

  @override
  State<_HouseTab> createState() => _HouseTabState();
}

class _HouseTabState extends State<_HouseTab> with TickerProviderStateMixin {
  late final TabController controller;

  callback() {
    setState(() {});
  }

  @override
  void initState() {
    controller = TabController(length: widget.house.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = (widget.house as List<dynamic>).map(
      (e) {
        return Tab(
          text: e["name"],
        );
      },
    ).toList();

    List<HouseScreen> screens = (widget.house as List<dynamic>).map(
      (e) {
        return HouseScreen(
          index: e["id"],
        );
      },
    ).toList();

    print(screens.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Дома"),
        actions: [
          IconButton(
              onPressed: () {
                HomeUserService(context).createHouse();
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                HomeUserService(context).joinHouse();
              },
              icon: Icon(Icons.login_sharp)),
          IconButton(
              onPressed: () {
                HomeUserService(context).showUserDialog(controller.index);
              },
              icon: Icon(Icons.list_alt)),
          //Keycloak.loginButton
        ],
        bottom: TabBar(controller: controller, tabs: tabs),
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
        children: screens,
      ),
    );
  }
}
