import 'package:flutter/material.dart';
import '../Model/car.dart';

class AddCar extends StatefulWidget {
  final void Function(Car car) onAddCar;

  const AddCar({super.key, required this.onAddCar});

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final _nameController = TextEditingController();
  final _imagePathController = TextEditingController();

  Category _selectedCategory = Category.hatchBack;

  void _submit() {
    if (_nameController.text.trim().isEmpty ||
        _imagePathController.text.trim().isEmpty) {
      return;
    }

    widget.onAddCar(
      Car(
        name: _nameController.text.trim(),
        category: _selectedCategory,
        imagePath: _imagePathController.text.trim(),
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Car name'),
          ),
          TextField(
            controller: _imagePathController,
            decoration: const InputDecoration(
              labelText: 'Image path (temporary)',
            ),
          ),
          const SizedBox(height: 12),
          DropdownButton<Category>(
            value: _selectedCategory,
            isExpanded: true,
            items: Category.values.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(categoryDisplayName(category)),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: _submit, child: const Text('Add Car')),
        ],
      ),
    );
  }
}
