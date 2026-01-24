import 'package:uuid/uuid.dart';

const uuid = Uuid();
String categoryToString(Category category) {
  return category.name[0].toUpperCase() + category.name.substring(1);
}

enum Category {
  stationWagon,
  sport,
  hatchBack,
  saloon,
  suv,
  pickupTruck,
  twoSeater,
  offRoader,
}

class Car {
  final String id;
  final String name;
  final Category category;
  final String imagePath;

  Car({required this.name, required this.category, required this.imagePath})
    : id = uuid.v4();
}
