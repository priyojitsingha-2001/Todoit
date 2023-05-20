import 'package:flutter/material.dart';

import 'package:todo_list_app/models/task.dart';
import 'package:todo_list_app/widgets/newtask.dart';
import 'package:todo_list_app/widgets/tasklist.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> Tasks = [
    Task(taskName: "Homework", isDone: false),
    Task(taskName: "Groceries", isDone: false),
  ];

  // to delete task
  void deletetask(int index) {
    setState(() {
      Tasks.removeAt(index);
    });
  }

  void addnewtask(String taskname) {
    setState(() {
      Tasks.add(Task(taskName: taskname, isDone: false));
    });
  }

  void createNewTask() {
    showDialog(
        context: context, builder: (_) => NewTask(addTaskCallback: addnewtask));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo App"),
        centerTitle: true,
      ),
      body: TaskList(tasklist: Tasks, deletetask: deletetask),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask, child: Icon(Icons.add)),
    );
  }
}
