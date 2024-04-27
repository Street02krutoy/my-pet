import 'package:flutter/material.dart';
import 'package:my_pet/classes/pet_class.dart';
import 'package:my_pet/utils/AnimalType.dart';
import 'package:my_pet/utils/FinanceType.dart';
import 'classes/event_class.dart';
import 'classes/finance_class.dart';
import 'classes/user_class.dart';

User gUser = User();

List<Pet> gPets = [
  Pet("Барсик", AnimalType.cat),
  Pet("Буся", AnimalType.dog),
  Pet("Даня", AnimalType.hamster)
];

late Map<DateTime, List<Event>> gMapEvents;

List<Event> gEvents = [
  Event(gPets[0], "Покормить Барсика", DateTime.now()),
  // Event(gPets[1], "Купить шампунь Бусе", DateTime.now().add(const Duration(days: 1))),
  // Event(gPets[2], "Погулять с Даней", DateTime.now().add(const Duration(days: 3)))
];

List<Finance> gFinance = [
  Finance("Корм Барсику", DateTime.now(), FinanceType.feed, 50),
  // Finance("Погремушка попугаю", DateTime.now().subtract(const Duration(days: 3)), FinanceType.toys, 249),
  // Finance("Ошейники от блох", DateTime.now().subtract(const Duration(days: 5)), FinanceType.medicine, 599),
  // Finance("", DateTime.now().subtract(const Duration(days: 5)), FinanceType.other, 375)
];

var isNeedUpdatePets = ValueNotifier<bool>(false);

var gSelectedDate = DateTime.now();
