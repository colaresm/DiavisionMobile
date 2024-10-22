import 'package:diavision/presentation/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 105, 255, 110),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 105, 255, 110)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
