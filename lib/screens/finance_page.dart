// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_pet/screens/subscreens/add_finance.dart';
import 'package:my_pet/utils/FinanceType.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../global.dart';
import '../utils/keycloak.dart';

class FinancePageWidget extends StatefulWidget {
  const FinancePageWidget({super.key});

  @override
  State<FinancePageWidget> createState() => _FinancePageWidgetState();
}

class _FinancePageWidgetState extends State<FinancePageWidget> {
  callback() {
    setState(() {
      pieData = <_PieData>[
        _PieData("Корм", 0),
        _PieData("Игрушки", 0),
        _PieData("Лекарства", 0),
        _PieData("Другое", 0),
      ];

      for (var data in gFinance) {
        pieData[getFinanceTypeID(data.financeType)].yData += data.cost;
      }
    });
  }

  var pieData = <_PieData>[
    _PieData("Корм", 0),
    _PieData("Игрушки", 0),
    _PieData("Лекарства", 0),
    _PieData("Другое", 0),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var data in gFinance) {
      pieData[getFinanceTypeID(data.financeType)].yData += data.cost;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Финансы"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FinanceCreatePage(callbackParent: callback)),
                );
              },
              icon: const Icon(Icons.add),
              iconSize: 32,
            ),
            Keycloak.loginButton
          ],
        ),
        body: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: SfCircularChart(
                          title: ChartTitle(text: 'Затраты'),
                          legend: Legend(isVisible: true),
                          series: <PieSeries<_PieData, String>>[
                        PieSeries<_PieData, String>(
                            explode: true,
                            explodeIndex: 0,
                            dataSource: pieData,
                            xValueMapper: (_PieData data, _) => data.xData,
                            yValueMapper: (_PieData data, _) => data.yData,
                            dataLabelMapper: (_PieData data, _) => data.text,
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true)),
                      ])),
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
                                  child: Container(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 16, 8),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 8, 16, 8),
                                            child: Row(
                                              children: [
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          "${gFinance[index].cost}₽",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleMedium
                                                              ?.copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                      gFinance[index].note != ""
                                                          ? Text(
                                                              gFinance[index]
                                                                  .note,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleMedium)
                                                          : const Divider(
                                                              height: 0,
                                                            ),
                                                      Text(
                                                          DateFormat(
                                                                  'dd/MM/yyyy')
                                                              .format(gFinance[
                                                                      index]
                                                                  .date),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelLarge)
                                                    ]),
                                              ],
                                            ),
                                          ),
                                          Ink(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: IconButton(
                                                  // iconSize: 32,
                                                  onPressed: () {
                                                    pieData[getFinanceTypeID(
                                                            gFinance[index]
                                                                .financeType)]
                                                        .yData -= gFinance[
                                                            index]
                                                        .cost;
                                                    if (pieData[getFinanceTypeID(
                                                                gFinance[index]
                                                                    .financeType)]
                                                            .yData <
                                                        0) {
                                                      pieData[getFinanceTypeID(
                                                              gFinance[index]
                                                                  .financeType)]
                                                          .yData = 0;
                                                    }
                                                    gFinance.remove(
                                                        gFinance[index]);
                                                    setState(() {});
                                                  },
                                                  icon: const Icon(
                                                      Icons.delete))),
                                        ]),
                                  ));
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                                        height: 16, indent: 10, endIndent: 10),
                            itemCount: gFinance.length)),
                  )
                ])));
  }
}

class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  late num yData;
  String? text;
}
