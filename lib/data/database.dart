import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

  List todolist = [];
  //reference our box

  final mybox = Hive.openBox('mybox');


}