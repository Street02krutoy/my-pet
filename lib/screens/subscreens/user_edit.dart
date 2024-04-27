import 'package:flutter/material.dart';

import '../../global.dart';


class UserEditPage extends StatefulWidget {
  const UserEditPage({super.key, required this.callbackParent});

  final Function callbackParent;

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Добавить напоминание")
        ),

        body:
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                          child:
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: Image.asset('asset_files/images/men.jpg').image,
                              ),
                            ),
                          )
                      ),
                      Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 200,
                                child: TextFormField(
                                  onChanged: (text) {
                                    gUser.name = text;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Имя пользователя...",
                                  ),
                                  initialValue: gUser.name,
                                  maxLines: 1,
                                  minLines: 1,
                                )
                            ),
                            SizedBox(
                                width: 200,
                                child: TextFormField(
                                  onChanged: (text) {
                                    gUser.mail = text;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Почта пользователя...",
                                  ),
                                  initialValue: gUser.mail,
                                  maxLines: 1,
                                  minLines: 1,
                                )
                            ),
                            const Divider(height: 16, color: Color.fromRGBO(0, 0, 0, 0),)
                          ]
                      )
                    ],
                  )
              ),
            ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.callbackParent();
          Navigator.pop(context);
        },
        tooltip: 'Сохранить изменения',
        child: const Icon(Icons.save),
      ),
    );
  }
}

