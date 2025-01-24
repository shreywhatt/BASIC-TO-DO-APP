import 'package:flutter/material.dart';

class todotile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  todotile({super.key,
    required this.taskName,
    required this.onChanged,
    required this.taskCompleted,
  }
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            //checkbox
            Checkbox(value: taskCompleted, onChanged: onChanged),
            //task name
            Text(taskName),
          ],
        ),
        decoration: BoxDecoration(color: Colors.deepPurple.shade300,
            borderRadius: BorderRadius.circular(15)),
      ),

    );
  }
}
