import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeUserService {
  final BuildContext context;

  HomeUserService(this.context);

  Future<void> joinHouse() async {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Join house'),
            content: SingleChildScrollView(
              child: TextField(
                decoration: InputDecoration(labelText: "ВВЕДИТЕ КОД ДОСТУПА"),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('Close'),
              ),
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('Ok'),
              ),
            ],
          );
        });
  }

  Future<void> createHouse() async {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Create house'),
            content: SingleChildScrollView(
              child: TextField(
                decoration: InputDecoration(labelText: "ВВЕДИТЕ ИМЯ ДОМА"),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('Close'),
              ),
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('Ok'),
              ),
            ],
          );
        });
  }

  Future<void> showUserDialog(int index) async {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Your $index house`s members'),
            content: SingleChildScrollView(
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Member number $index'),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.cancel),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: 100),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('Close'),
              ),
            ],
          );
        });
  }
}
