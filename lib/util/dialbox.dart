import 'package:flutter/material.dart';
import 'package:todolistapp/util/buttons.dart';

class Dialbox extends StatelessWidget {

  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  Dialbox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height:120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller:controller,
              cursorColor: Colors.deepPurple,

              decoration: InputDecoration(border: OutlineInputBorder(),

              hintText: "Add a new task",),
            ),

            //buttons => save+cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                //save button
                myButton(text: "S A V E", onPressed: onSave),

                const SizedBox(width: 4,),

                //cancel button
                myButton(text: "C A N C E L", onPressed: onCancel),
              ],
            )
          ],
        )
      ),
    );
  }
}
