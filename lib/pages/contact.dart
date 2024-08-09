import 'package:flutter/material.dart';
import 'package:store_responsive_dashboard/layout/main_layout.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Center(
        child: Text(
          'Contact Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}