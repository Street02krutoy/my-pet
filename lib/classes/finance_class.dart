import '../utils/FinanceType.dart';

class Finance {
  String note = '';
  DateTime date = DateTime.now();
  FinanceType financeType = FinanceType.other;
  int cost = 0;

  Finance (this.note, this.date, this.financeType, this.cost);
}