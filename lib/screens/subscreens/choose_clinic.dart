import 'package:flutter/material.dart';

class ChooseClinic extends StatefulWidget {
  final Function callbackParent;

  const ChooseClinic({Key? key, required this.callbackParent})
      : super(key: key);

  @override
  State<ChooseClinic> createState() => _ChooseClinicState();
}

class _ChooseClinicState extends State<ChooseClinic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Добавить напоминание")),
      body: SingleChildScrollView(
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return index == 0
                  ? InkWell(
                      onTap: () {
                        widget.callbackParent();
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Без клиники $index'),
                            Text(
                              "оставить вашего животного без клиники :( $index",
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        widget.callbackParent();
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('клиника крутая ветеренарная $index'),
                            Text(
                              "ОПИСАНИЕ клиники крутой ветеренарной номер $index",
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: 10),
      ),
    );
  }
}
