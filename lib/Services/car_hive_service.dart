import 'package:hive/hive.dart';
import '../Model/car.dart';

class CarHiveService {
  static final Box _box = Hive.box('carsBox');

  // Save a car
  static void addCar(Car car) {
    // Use ID as key to avoid duplicates
    _box.put(car.id, {
      'id': car.id,
      'name': car.name,
      'category': car.category.index,
      'imagePath': car.imagePath,
      'isUserCar': car.isAssetImage,
    });
  }

  // Get all cars
  static List<Car> getCars() {
    return _box.values.map((carMap) {
      return Car(
        name: carMap['name'],
        category: Category.values[carMap['category']],
        imagePath: carMap['imagePath'],
        isAssetImage: carMap['isUserCar'] ?? true,
      );
    }).toList();
  }
}
