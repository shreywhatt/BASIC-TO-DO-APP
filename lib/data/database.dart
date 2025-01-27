import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

  List todolist = [];
  //reference our box

  final mybox = Hive.box('mybox');

  // method if this is the 1st time ever opening this app
  void createInitialData() {
    todolist = [
      ["MAKE TUTORIAL", false],
      ["Do exercise", false],
    ];

  }

    // load the data from the database
    void loadData(){
    todolist = mybox.get("TODOLIST");

    }

    //update the database
    void updateDatabase(){
    mybox.put("TODOLIST", todolist);

    }

}