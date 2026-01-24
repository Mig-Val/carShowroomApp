import 'dart:ui';

import 'package:uuid/uuid.dart';

const uuid = Uuid();
String categoryToString(Category category) {
  return category.name[0].toUpperCase() + category.name.substring(1);
}

String categoryDisplayName(Category category) {
  switch (category) {
    case Category.stationWagon:
      return 'Station Wagon';
    case Category.sport:
      return 'Sport';
    case Category.hatchBack:
      return 'Hatchback';
    case Category.saloon:
      return 'Saloon';
    case Category.suv:
      return 'SUV';
    case Category.pickupTruck:
      return 'Pickup Truck';
    case Category.twoSeater:
      return 'Two Seater';
    case Category.offRoader:
      return 'Off-Roader';
  }
}

Color categoryColor(Category category) {
  switch (category) {
    case Category.stationWagon:
      return const Color(0xFFB5EAD7);
    case Category.sport:
      return const Color(0xFFFFC6C7);
    case Category.hatchBack:
      return const Color(0xFFFFE1A8);
    case Category.saloon:
      return const Color(0xFFC7CEEA);
    case Category.suv:
      return const Color(0xFFBEE7E8);
    case Category.pickupTruck:
      return const Color(0xFFD5E8D4);
    case Category.twoSeater:
      return const Color(0xFFFADADD);
    case Category.offRoader:
      return const Color(0xFFE2D1C3);
  }
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
