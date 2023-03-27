import 'package:flutter/material.dart';
import '../screens/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie DB App',
      theme: ThemeData(
        colorScheme: (const ColorScheme.dark(
          primary: Colors.black87,
          secondary: Colors.blue,
        )),
      ),
      home: const Home(),
    );
  }
}