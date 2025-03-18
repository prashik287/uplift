import 'package:flutter/material.dart';
import 'package:uplift/screens/upload.dart';
import "package:uplift/home.dart";

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // ✅ Correct Route Setup
      initialRoute: '/upload',
      routes: {
        '/': (context) => Home(),
        '/upload': (context) => const FileUploadPage(),
      },
    );
  }
}
