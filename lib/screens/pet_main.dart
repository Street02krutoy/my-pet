import 'package:flutter/material.dart';
import 'package:my_pet/classes/pet_class.dart';
import 'package:my_pet/global.dart';
import 'package:my_pet/screens/subscreens/pet_creating.dart';
import 'package:my_pet/screens/subscreens/pet_info.dart';
import 'package:my_pet/utils/AnimalType.dart';
import 'package:my_pet/utils/keycloak.dart';

class PetMainPage extends StatefulWidget {
  const PetMainPage({super.key});

  @override
  State<PetMainPage> createState() => _PetMainPageState();
}

class _PetMainPageState extends State<PetMainPage> {
  callback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Питомцы"),
          actions: [Keycloak.loginButton(context)],
        ),
        body: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 16, 0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 8, 16, 8),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Text("Список питомцев",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold))),
                      Ink(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PetCreatePage(
                                          title: "Новый питомец",
                                          pet: Pet("", AnimalType.noExist),
                                          callbackParent: callback,
                                          callbackMain: callback)),
                                );
                              },
                              icon: const Icon(Icons.add)))
                    ],
                  ),
                  const Divider(
                    height: 16,
                    color: Color.fromRGBO(0, 0, 0, 0),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PetInfoPage(
                                          title: gPets[index].name,
                                          pet: gPets[index],
                                          callback: callback)),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 8),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 8, 16, 8),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 80.0,
                                              height: 80.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image:
                                                      gPets[index].image.image,
                                                ),
                                              ),
                                            ),
                                            const VerticalDivider(
                                                width: 16,
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 0)),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(gPets[index].name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1),
                                                  Text(
                                                    getAnimalTypeStr(
                                                        gPets[index]
                                                            .animalType),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                    overflow: TextOverflow.fade,
                                                  )
                                                ]),
                                          ],
                                        ),
                                      ),
                                      const Icon(Icons.arrow_forward_ios)
                                    ]),
                              ));
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                                height: 16, indent: 10, endIndent: 10),
                        itemCount: gPets.length),
                  ))
                ])));
  }
}
