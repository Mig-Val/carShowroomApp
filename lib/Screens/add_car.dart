import 'package:flutter/material.dart';
import 'package:miguel_valentino_showroom/Services/NotificationServices';
import '../Model/car.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddCar extends StatefulWidget {
  final void Function(Car car) onAddCar;

  const AddCar({super.key, required this.onAddCar});

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final _nameController = TextEditingController();
  //final _imagePathController = TextEditingController();
  File? _pickedImage;

  Category _selectedCategory = Category.hatchBack;

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (pickedFile == null) return;

    setState(() {
      _pickedImage = File(pickedFile.path);
    });
  }

  void _submit() {
    if (_nameController.text.trim().isEmpty || _pickedImage == null) {
      return;
    }

    widget.onAddCar(
      Car(
        name: _nameController.text.trim(),
        category: _selectedCategory,
        imagePath: _pickedImage!.path,
        isAssetImage: false,
      ),
    );

    Navigator.of(context).pop();
    NotificationService.showCarAddedNotification(_nameController.text.trim());
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
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: _takePhoto,
            icon: const Icon(Icons.camera_alt),
            label: const Text('Take Photo'),
          ),
          const SizedBox(height: 12),
          if (_pickedImage != null)
            Image.file(
              _pickedImage!,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
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
