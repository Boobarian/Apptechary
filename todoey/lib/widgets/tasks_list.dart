import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_list.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatefulWidget {

  final TaskList tasks;

  TasksList(this.tasks);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
      return TaskTile(taskTitle: widget.tasks[index].name,
        isChecked: widget.tasks[index].isDone,
        checkboxCallback: (callbackState){
          setState(() {
            widget.tasks[index].toggleDone();
          });
        },);
    }, itemCount: widget.tasks.length,);
  }
}

