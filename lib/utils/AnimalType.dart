enum AnimalType {
  dog,
  cat,
  parrot,
  hamster,
  noExist
}

String getAnimalTypeStr(AnimalType animalType) {
  switch(animalType) {
    case AnimalType.dog:
      return "Собака";
    case AnimalType.cat:
      return "Кот";
    case AnimalType.parrot:
      return "Попугай";
    case AnimalType.hamster:
      return "Хомяк";
    case AnimalType.noExist:
      return "";
  }
}

AnimalType? getAnimalType(String animalType) {
  switch(animalType) {
    case "Собака":
      return AnimalType.dog;
    case "Кот":
      return AnimalType.cat;
    case "Попугай":
      return AnimalType.parrot;
    case "Хомяк":
      return AnimalType.hamster;
    default:
      return null;
  }
}