enum FinanceType {
  toys,
  feed,
  medicine,
  other
}

getFinanceTypeID(FinanceType finance) {
  switch (finance) {
    case FinanceType.feed:
      return 0;
    case FinanceType.toys:
      return 1;
    case FinanceType.medicine:
      return 2;
    case FinanceType.other:
      return 3;
  }
}

getFinanceTypeStr(FinanceType finance) {
  switch (finance) {
    case FinanceType.feed:
      return "Корм";
    case FinanceType.toys:
      return "Игрушки";
    case FinanceType.medicine:
      return "Лекарства";
    case FinanceType.other:
      return "Другое";
  }
}

getFinanceType(String finance) {
  switch (finance) {
    case "Корм":
      return FinanceType.feed;
    case "Лекарства":
      return FinanceType.medicine;
    case "Игрушки":
      return FinanceType.toys;
    case "Другое":
      return FinanceType.other;
  }
}