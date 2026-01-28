import 'package:flutter/material.dart';
import '../Model/car.dart';
import 'cars_screen.dart';
import '../Data/dummy_data.dart';
import 'add_car.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  void _openAddCar() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return AddCar(
          onAddCar: (car) {
            setState(() {
              dummyCars.add(car);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = Category.values;

    return Scaffold(
      backgroundColor: const Color(0xFF2B2B2B),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 132, 119, 248),
        title: const Text('Car Showroom'),
        actions: [
          IconButton(
            onPressed: _openAddCar,
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 3 / 2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CarsScreen(category: category),
                ),
              );
            },
            child: Card(
              color: categoryColor(category),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  categoryDisplayName(category),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2B2B2B),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
