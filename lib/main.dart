import 'selection_page.dart';
import 'package:flutter/material.dart';
import 'welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectionPage(),
      // debugShowMaterialGrid: true, // Enable debug paint
    );
  }
}