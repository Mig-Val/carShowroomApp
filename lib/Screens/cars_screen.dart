import 'package:flutter/material.dart';
import '../Model/car.dart';
import '../Data/dummy_data.dart';

class CarsScreen extends StatelessWidget {
  final Category category;

  const CarsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final carsInCategory = dummyCars
        .where((car) => car.category == category)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF2B2B2B),
      appBar: AppBar(title: Text(categoryDisplayName(category))),
      body: ListView.builder(
        itemCount: carsInCategory.length,
        itemBuilder: (context, index) {
          final car = carsInCategory[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    car.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                  child: Image.asset(
                    car.imagePath,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        height: 180,
                        child: Center(
                          child: Icon(Icons.directions_car, size: 40),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
