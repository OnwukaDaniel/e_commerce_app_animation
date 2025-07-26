import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_app/home.dart';
import 'package:e_commerce_app/home2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    enabled: kDebugMode || kIsWeb,
      builder: (_) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECommerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Monterrat',/**/
      ),
      home: const Home2(),
    );
  }
}
