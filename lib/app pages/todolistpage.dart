import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolistapp/data/database.dart';
import 'package:todolistapp/util/dialbox.dart';
import '../util/todotile.dart';

class todolistpage extends StatefulWidget {
  const todolistpage({super.key});

  @override
  State<todolistpage> createState() => _todolistpageState();
}

class _todolistpageState extends State<todolistpage> {

  //reference the hive box
  final mybox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // if this is the first time ever opening the app, then create default data
    if (mybox.get("TODOLIST")== null){
      db.createInitialData();
    }
    else{
      // there already exist data
      db.loadData();
    }

    super.initState();
  }

  //text controller
  final controller = TextEditingController();
  // list of todo tasks



  //method for checkbox was tapped
  void CheckBoxChanged(bool? value, int index){
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateDatabase();
  }

  //save new task
  void savenewtask(){
    setState(() {
      db.todolist.add([controller.text, false],);
      controller.clear();
      Navigator.of(context).pop();
    },
    );
    db.updateDatabase();
  }

  //method to add new task
  void createNewTask( ){
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

  //delete the task
  void deleteTask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateDatabase();

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
        itemCount: db.todolist.length,
        itemBuilder: (context, index) {
          return todotile(
          taskName: db.todolist[index][0],
          taskCompleted: db.todolist[index][1],
          onChanged:(value) => CheckBoxChanged(value,index),
            deleteFunction: (context) => deleteTask(index,),
          );
        },
      )
    );
  }
}
