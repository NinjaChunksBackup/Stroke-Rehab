import 'package:flutter/material.dart';
import 'package:store_responsive_dashboard/pages/dashboard.dart';
import 'package:store_responsive_dashboard/constaints.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Dashboard',
      theme: ThemeData(
          fontFamily: 'Nunito',
          primaryColor: primary,
          textTheme: TextTheme().apply(bodyColor: textColor),
          colorScheme: ColorScheme.fromSeed(seedColor: primary)
      ),
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}