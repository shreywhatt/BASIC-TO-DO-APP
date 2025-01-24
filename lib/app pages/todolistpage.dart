import 'package:flutter/material.dart';
import '../util/todotile.dart';

class todolistpage extends StatefulWidget {
  const todolistpage({super.key});

  @override
  State<todolistpage> createState() => _todolistpageState();
}

class _todolistpageState extends State<todolistpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade400,
        title:
        Text("TO DO",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),

      ),
      body: ListView(
        children: [
          todotile(
            taskName: "Sleep for 8 Hours",
            taskCompleted: true,
            onChanged: (p0) {},
          ),

          todotile(
            taskName: "Go for walk",
            taskCompleted: false,
            onChanged: (p0) {},
          ),
        ],
      ),
    );
  }
}
