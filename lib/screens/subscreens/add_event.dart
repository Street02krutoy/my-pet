import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_pet/classes/event_class.dart';
import 'package:my_pet/global.dart';

import '../../classes/pet_class.dart';

class AddEvent extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final Pet pet;
  final Function callbackParent;

  const AddEvent(
      {Key? key,
      required this.firstDate,
      required this.lastDate,
      required this.pet,
      required this.callbackParent})
      : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  DateTime dateTime = DateTime.now();
  final _titleController = TextEditingController();

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? pickedDate = await showDatePicker(
  //
  //     context: context,
  //     initialDate: _selectedDate,
  //     firstDate: DateTime(2015),
  //     lastDate: DateTime(2050));
  //     if (pickedDate != null && pickedDate != _selectedDate) {
  //       setState(() {
  //         _selectedDate = pickedDate;
  //       });
  //     }
  // }

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (selected != null && selected != _selectedDate) {
      setState(() {
        _selectedDate = selected;
      });
    }
    return _selectedDate;
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (selected != null && selected != _selectedTime) {
      setState(() {
        _selectedTime = selected;
      });
    }
    return _selectedTime;
  }

  Future _selectDateTime(BuildContext context) async {
    final date = await _selectDate(context);
    // ignore: unnecessary_null_comparison
    if (date == null) return;

    final time = await _selectTime(context);

    // ignore: unnecessary_null_comparison
    if (time == null) return;
    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  String getDateTime() {
    // ignore: unnecessary_null_comparison
    return DateFormat('dd.MM.yyyy HH:mm a').format(dateTime);
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = gSelectedDate;
    _selectedTime = TimeOfDay.now();

    dateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      TimeOfDay.now().hour,
      TimeOfDay.now().minute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Добавить напоминание")),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: _titleController,
                maxLines: 1,
                decoration: const InputDecoration(labelText: 'Напоминание:'),
              ),
            ),
            const Divider(height: 16, color: Color.fromRGBO(0, 0, 0, 0)),
            Row(
              children: [
                const VerticalDivider(
                    width: 16, color: Color.fromRGBO(0, 0, 0, 0)),
                Text(getDateTime()),
                const VerticalDivider(
                    width: 16, color: Color.fromRGBO(0, 0, 0, 0)),
                Ink(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        // iconSize: 32,
                        onPressed: () {
                          _selectDateTime(context);
                        },
                        icon: const Icon(Icons.access_time))),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent,
        tooltip: 'Сохранить изменения',
        child: const Icon(Icons.save),
      ),
    );
  }

  void _addEvent() async {
    Event newEvent = Event(widget.pet, _titleController.text, dateTime);

    gEvents.add(newEvent);
    widget.pet.events.add(newEvent);
    widget.callbackParent();
    Navigator.pop(context);
  }
}
