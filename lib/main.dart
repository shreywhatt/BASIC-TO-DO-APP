import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolistapp/app%20pages/todolistpage.dart';

void main() async {
  //initialize hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('mybox');

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

