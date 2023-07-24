import 'package:culture_app/view/bmi_first.dart';
import 'package:culture_app/view/bmi_second.dart';
import 'package:culture_app/view/first.dart';
import 'package:culture_app/view/home.dart';
import 'package:culture_app/view/second.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/1st": (context) => const First(),
        "/2nd": (context) => const Second(),
        "/bmi1st": (context) => const FirstBMI(),
        "/bmi2nd": (context) => const SecondBMI(),
      }, 
    );
  }
}
