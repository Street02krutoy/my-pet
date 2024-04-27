import 'package:flutter/material.dart';
import 'package:my_pet/screens/subscreens/components/animal_records.dart';
import 'package:my_pet/screens/subscreens/components/info_box.dart';
import 'package:my_pet/screens/subscreens/pet_creating.dart';

import '../../classes/pet_class.dart';
import '../../global.dart';
import '../../utils/AnimalType.dart';

class PetInfoPage extends StatefulWidget {
  final String title;
  final Pet pet;

  final Function callback;

  const PetInfoPage(
      {super.key,
      required this.title,
      required this.pet,
      required this.callback});

  @override
  State<PetInfoPage> createState() => _PetInfoPageState();
}

class _PetInfoPageState extends State<PetInfoPage> {
  late Pet pet = widget.pet;

  callback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PetCreatePage(
                          title: "Изменение",
                          pet: pet,
                          callbackParent: callback,
                          callbackMain: widget.callback)),
                );
              },
              icon: const Icon(Icons.edit),
              iconSize: 32,
            ),
            IconButton(
              onPressed: () {
                gPets.remove(pet);
                // isNeedUpdatePets.value = true;
                widget.callback();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete),
              iconSize: 32,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
              child: Column(children: [
                InfoBox(
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 8, 16, 8),
                          child: Container(
                            width: 96.0,
                            height: 96.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: pet.image.image,
                              ),
                            ),
                          )),
                      Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pet.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            Text(
                              getAnimalTypeStr(pet.animalType),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                            ),
                            Text("На учёте в \nклиника крутая ветеринарная",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 10))
                          ]),
                    ],
                  ),
                ),
                const Divider(height: 16, color: Color.fromRGBO(0, 0, 0, 0)),
                TextFormField(
                  onChanged: (text) {
                    pet.setNote(text);
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hoverColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: "Заметка...",
                  ),
                  initialValue: pet.getNote(),
                  maxLines: 4,
                  minLines: 1,
                ),
                const Divider(height: 16, color: Color.fromRGBO(0, 0, 0, 0)),
                // ignore: prefer_const_constructors
                AnimalRecords(),
              ])),
        ));
  }
}
