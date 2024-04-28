import 'package:flutter/material.dart';
import 'package:my_pet/screens/subscreens/choose_clinic.dart';
import '../../classes/pet_class.dart';
import '../../global.dart';
import '../../utils/AnimalType.dart';
import 'package:image_picker/image_picker.dart';

ImagePicker picker = ImagePicker();

class PetEditPage extends StatefulWidget {
  final String title;
  final Pet pet;
  final Function callbackParent;
  final Function callbackMain;

  const PetEditPage(
      {super.key,
      required this.title,
      required this.pet,
      required this.callbackParent,
      required this.callbackMain});

  @override
  State<PetEditPage> createState() => _PetEditPageState();
}

class _PetEditPageState extends State<PetEditPage> {
  void _savePet() {
    if (pet.name == '') {
      gPets.add(pet);
    }

    pet.name = newPetName;
    pet.animalType = getAnimalType(_selectedAnimal)!;
    pet.setImage();

    widget.callbackParent();
    widget.callbackMain();

    Navigator.pop(context);
  }

  late Pet pet = widget.pet;
  late String _selectedAnimal = getAnimalTypeStr(pet.animalType) != ""
      ? getAnimalTypeStr(pet.animalType)
      : "Кот";
  late String newPetName = pet.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title)),
      body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
          child: Column(children: [
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                        child: Container(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 8, 16, 8),
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
                          SizedBox(
                              width: 200,
                              child: TextFormField(
                                onChanged: (text) {
                                  newPetName = text;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Имя питомца...",
                                ),
                                initialValue: pet.name,
                                maxLines: 1,
                                minLines: 1,
                              )),
                          DropdownButton<String>(
                            items: <String>['Собака', 'Кот', 'Попугай', 'Хомяк']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            dropdownColor: Colors.white,
                            value: _selectedAnimal,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedAnimal = newValue!;
                              });
                            },
                          ),
                          DropdownButton<String>(
                            items: <String>[
                              'Порода 1',
                              'Порода 2',
                              'Порода 3',
                              'Порода 4'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            dropdownColor: Colors.white,
                            value: null,
                            onChanged: (newValue) {
                              setState(() {
                                //_selectedAnimal = newValue!;
                              });
                            },
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChooseClinic(
                                          callbackParent: callback)),
                                );
                              },
                              child: Text("Выбрать клинику"))
                        ]),
                  ],
                )),
            const Divider(height: 16, color: Color.fromRGBO(0, 0, 0, 0)),
          ])),

      floatingActionButton: FloatingActionButton(
        onPressed: _savePet,
        tooltip: 'Сохранить изменения',
        child: const Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  callback() {
    setState(() {});
  }
}
