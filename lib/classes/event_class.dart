import 'package:my_pet/classes/pet_class.dart';

class Event {
  late Pet refPet;
  late String note;
  late DateTime date;

  Event(this.refPet, this.note, this.date);
}
