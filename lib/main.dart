import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:previsao_tempo/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreen(),
      title: "Tempo",
      debugShowCheckedModeBanner: false,
    );
  }
}