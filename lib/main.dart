import 'package:flutter/material.dart';
import 'package:fundamentals/bottom_navigation.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

//open a boxP
  var box = await Hive.openBox('mybox');

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Hello", home: BottomNavigationCheck());
  }
}
