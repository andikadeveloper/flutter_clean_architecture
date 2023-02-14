import 'package:flutter/material.dart';

import 'presentation/pages/home_page.dart';
import 'di/locator.dart' as locator;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  locator.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
