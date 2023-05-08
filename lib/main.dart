import 'package:flutter/material.dart';
import 'package:bmi/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my bmi',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white,)
      ),
      debugShowCheckedModeBanner: false,
      home:const HomePage()
    );
  }
}
