// import 'package:flutter/material.dart';

// class AddEvent extends StatefulWidget {
//   final DateTime firstDate;
//   final DateTime lastDate;
//   final DateTime? selectedDate;
//   const AddEvent(
//       {Key? key,
//       required this.firstDate,
//       required this.lastDate,
//       this.selectedDate,
//       required String title})
//       : super(key: key);

//   @override
//   State<AddEvent> createState() => _AddEventState();
// }

// class _AddEventState extends State<AddEvent> {
//   late DateTime _selectedDate;
//   final _titleController = TextEditingController();
//   final _descController = TextEditingController();

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//         context: context,
//         initialDate: _selectedDate,
//         firstDate: DateTime(2015),
//         lastDate: DateTime(2050));
//     if (pickedDate != null && pickedDate != _selectedDate) {
//       setState(() {
//         _selectedDate = pickedDate;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = widget.selectedDate ?? DateTime.now();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Add Event")),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: [
//           InputDatePickerFormField(
//             firstDate: widget.firstDate,
//             lastDate: widget.lastDate,
//             initialDate: _selectedDate,
//             onDateSubmitted: (date) {
//               setState(() {
//                 _selectedDate = date;
//               });
//             },
//           ),
//           TextField(
//             controller: _titleController,
//             maxLines: 1,
//             decoration: const InputDecoration(labelText: 'Напоманание:'),
//           ),
//           const Divider(height: 32, color: Color.fromRGBO(0, 0, 0, 0)),
//           ElevatedButton(
//             onPressed: () => _selectDate(context),
//             child: const Text('Выбрать дату'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               _addEvent();
//             },
//             child: const Text("Save"),
//           ),
//         ],
//       ),
//     );
//   }

//   void _addEvent() async {}
// }
