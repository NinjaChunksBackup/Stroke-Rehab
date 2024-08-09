import 'package:flutter/material.dart';
import 'package:store_responsive_dashboard/model.dart';
import 'package:store_responsive_dashboard/constaints.dart';

class GameItem extends StatelessWidget {
  final Game game;
  final VoidCallback onDoubleTap;

  const GameItem({Key? key, required this.game, required this.onDoubleTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: Container(
        decoration: BoxDecoration(
          color: primaryLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              game.imagePath,
              width: 64,
              height: 64,
            ),
            SizedBox(height: 8),
            Text(
              game.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}