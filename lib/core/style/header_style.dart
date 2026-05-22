import 'package:flutter/material.dart';

class HeaderStyle {
  static TextStyle h1() {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle h6() {
    return const TextStyle(
      fontSize: 10,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle h2() {
    return const TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
}
