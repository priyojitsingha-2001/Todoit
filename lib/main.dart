import 'dart:math';

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

  List<String> imagelinks = [
    "assets/images/bgimage_1.jpg",
    "assets/images/bgimage_2.jpg",
    "assets/images/bgimage_3.jpg",
    "assets/images/bgimage_4.jpg",
  ];
  var random = Random();

  // to delete task
  void deletetask(int index) {
    setState(() {
      Tasks.removeAt(index);
    });
  }

  // to add new task
  void addnewtask(String taskname) {
    setState(() {
      Tasks.add(Task(taskName: taskname, isDone: false));
    });
  }

  //show a popup to add new task
  void createNewTask() {
    showDialog(
        context: context, builder: (_) => NewTask(addTaskCallback: addnewtask));
  }

  //to shuffle the images
  void shuffleimagelinks() {
    imagelinks.shuffle();
  }

  @override
  void initState() {
    shuffleimagelinks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('${imagelinks.first}'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:
            SafeArea(child: TaskList(tasklist: Tasks, deletetask: deletetask)),
        floatingActionButton: FloatingActionButton(
            onPressed: createNewTask, child: Icon(Icons.add)),
      ),
    );
  }
}
