import 'package:flutter/material.dart';
import 'package:store_responsive_dashboard/layout/main_layout.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Center(
        child: Text(
          'User Management Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}