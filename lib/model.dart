import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final Widget page;

  MenuItem(this.name, this.icon, this.page);
}

class History {
  final IconData icon;
  final String name;
  final int packs;
  final String status;
  final String date;
  History(this.icon, this.name, this.packs, this.status, this.date);
}

class News {
  final String title;
  final String imgUrl;
  final String time;
  final String description;

  News(this.time, this.title, this.imgUrl, [this.description = '']);
}

class PatientStatus {
  final String name;
  final String value;
  final IconData icon;

  PatientStatus(this.name, this.value, this.icon);
}

class Game {
  final String name;
  final String imagePath;
  final String exePath;

  Game(this.name, this.imagePath, this.exePath);
}
