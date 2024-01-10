import 'package:flutter/material.dart';
import 'package:to/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tu Doo',
      debugShowCheckedModeBanner: false,
      home: Home(
        tname: '',
        tdesc: '',
        tpriority: false,
      ),
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}
