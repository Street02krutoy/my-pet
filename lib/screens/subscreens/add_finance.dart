import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../classes/finance_class.dart';
import '../../global.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/FinanceType.dart';

ImagePicker picker = ImagePicker();

class FinanceCreatePage extends StatefulWidget {
  final Function callbackParent;

  const FinanceCreatePage({super.key, required this.callbackParent});

  @override
  State<FinanceCreatePage> createState() => _FinanceCreatePageState();
}

class _FinanceCreatePageState extends State<FinanceCreatePage> {
  void _saveFinance() {
    finance.financeType = getFinanceType(_selectedType)!;
    gFinance.add(finance);
    widget.callbackParent();

    Navigator.pop(context);
  }

  late Finance finance = Finance('', DateTime.now(), FinanceType.other, 0);
  late String _selectedType = "Другое";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Создать напоминание")),
      body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: Column(children: [
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                width: double.infinity,
                child: Row(
                  children: [
                    const VerticalDivider(
                        width: 16, color: Color.fromRGBO(0, 0, 0, 0)),
                    Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 300,
                              child: TextFormField(
                                onChanged: (text) {
                                  finance.note = text;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Заметка...",
                                ),
                                initialValue: '',
                                maxLines: 1,
                                minLines: 1,
                              )),
                          Row(
                            children: [
                              SizedBox(
                                  width: 100,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      // for below version 2 use this
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    onChanged: (text) {
                                      finance.cost = int.parse(text);
                                    },
                                    decoration: const InputDecoration(
                                      hintText: "Сумма...",
                                    ),
                                    initialValue: '',
                                    maxLines: 1,
                                    minLines: 1,
                                  )),
                              const VerticalDivider(
                                  width: 32, color: Color.fromRGBO(0, 0, 0, 0)),
                              DropdownButton<String>(
                                items: <String>[
                                  'Лекарства',
                                  'Игрушки',
                                  'Корм',
                                  'Другое'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                dropdownColor: Colors.white,
                                value: _selectedType,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedType = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                          const Divider(
                              height: 16, color: Color.fromRGBO(0, 0, 0, 0)),
                        ]),
                  ],
                )),
            const Divider(height: 16, color: Color.fromRGBO(0, 0, 0, 0)),
          ])),

      floatingActionButton: FloatingActionButton(
        onPressed: _saveFinance,
        tooltip: 'Сохранить изменения',
        child: const Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
