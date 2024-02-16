import 'package:bugetmanagement/view/Dashboard.dart';
import 'package:bugetmanagement/view/Expencelist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// void main() {
//   runApp(const MainApp());
// }

void main() async {

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExpenseList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
