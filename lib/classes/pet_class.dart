import 'package:flutter/material.dart';

import '../utils/AnimalType.dart';
import 'event_class.dart';

class Pet {
  String name = '';
  String note = '';
  late AnimalType animalType;
  Image image = Image.asset("assets/images/no_photo.jpg");
  List<Event> events = [];

  Pet(String name, AnimalType animalType) {
    this.name = name;
    this.animalType = animalType;
    setImage();
  }

  setNote(String note) {
    this.note = note;
  }

  getNote() {
    return note;
  }

  addEvent(Event event) {
    events.add(event);
  }

  setImage() {
    switch (animalType) {
      case AnimalType.cat:
        image = Image.asset('assets/images/cat.jpg');
        break;
      case AnimalType.dog:
        image = Image.asset('assets/images/dog.jpg');
        break;
      case AnimalType.parrot:
        image = Image.asset('assets/images/parrot.jpg');
        break;
      case AnimalType.hamster:
        image = Image.asset('assets/images/hamster.jpg');
        break;
      case AnimalType.noExist:
        image = Image.asset("assets/images/no_photo.jpg");
        break;
    }
  }
}
