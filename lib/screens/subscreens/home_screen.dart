import 'package:flutter/material.dart';
import 'package:my_pet/classes/pet_class.dart';
import 'package:my_pet/screens/subscreens/pet_info.dart';
import 'package:my_pet/utils/AnimalType.dart';

class HouseScreen extends StatefulWidget {
  const HouseScreen({super.key, required this.index});

  final int index;

  @override
  State<HouseScreen> createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> {
  callback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Card(
              child: Row(
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text("house ${widget.index}"),
                        const Spacer(),
                        Text(
                            "animals ${100.toString()}  members ${100.toString()}")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PetInfoPage(
                              title: "$index animal",
                              pet: Pet("$index animal", AnimalType.hamster),
                              callback: callback)),
                    );
                  },
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('animal $index'),
                        Text(
                          "клиника крутая ветеренарная $index",
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
        ],
      ),
    );
  }
}
