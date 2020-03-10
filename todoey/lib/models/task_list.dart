import 'package:flutter/cupertino.dart';
import 'package:todoey/models/task.dart';

class TaskList extends ChangeNotifier{
  List<Task> taskList = [];

  void addTask(String name){
    taskList.add(Task(name: name));
  }

  int getLength(){
    return taskList.length;
  }

  int
}
