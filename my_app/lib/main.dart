import 'package:flutter/material.dart';
import 'package:my_app/widgets/splash_screen.dart';

const savekeyName = 'UserLoggedIn';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const SplashScreen());
  }
}
