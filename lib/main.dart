import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:miguel_valentino_showroom/Screens/categories_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:miguel_valentino_showroom/Services/NotificationServices';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await NotificationService.init();

  await Hive.initFlutter();
  await Hive.openBox('carsBox');

  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: CategoriesScreen()),
  );
}
