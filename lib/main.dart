import 'package:flutter/material.dart';
import 'package:todolistapp/app%20pages/todolistpage.dart';

void main() {
  runApp(const todolistapp());
}

class todolistapp extends StatelessWidget {
  const todolistapp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: todolistpage(),

      );
  }
}

