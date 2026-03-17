import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice_akshit/features/home/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(backgroundColor: Colors.teal.shade500),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
