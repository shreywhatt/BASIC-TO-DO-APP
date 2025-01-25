import 'package:flutter/material.dart';
import 'package:todolistapp/util/dialbox.dart';
import '../util/todotile.dart';

class todolistpage extends StatefulWidget {
  const todolistpage({super.key});

  @override
  State<todolistpage> createState() => _todolistpageState();
}

class _todolistpageState extends State<todolistpage> {
  //text controller
  final controller = TextEditingController();
  // list of todo tasks

  List todolist = [
    ["Make tutorial", false],
    ["Do exercise", false],
  ];

  //method for checkbox was tapped
  void CheckBoxChanged(bool? value, int index){
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  //save new task
  void savenewtask(){
    setState(() {
      todolist.add([controller.text, false],);
    },
    );
  }

  //method to add new task
  void createNewTask(){
    showDialog(
        context: context,
        builder: (context){
          return Dialbox(
            controller: controller ,
            onSave: savenewtask,
            onCancel: () => Navigator.of(context).pop(),

          );
        },
    );
  }
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
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
      child: Icon(Icons.add),
      ),


      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index) {
          return todotile(
          taskName: todolist[index][0],
          taskCompleted: todolist[index][1],
          onChanged:(value) => CheckBoxChanged(value,index),
          );
        },
      )
    );
  }
}
