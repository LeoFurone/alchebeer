import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_ambev/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: App(),
      debugShowCheckedModeBanner: false,
    );
  }
}
