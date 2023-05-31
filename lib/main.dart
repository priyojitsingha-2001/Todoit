import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // Task(taskName: 'write a blog', isDone: false),
    // Task(taskName: 'leetcode', isDone: false),
  ];

  void addtolocal(List<Task> Tasks) async {
    //convert List<Task> to List<String>
    List<String> newlist = [];
    Tasks.forEach((element) {
      // convert element to => map => json string => and add to list
      newlist.add(jsonEncode(element.toMap()));
    });
    //get insatnce
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //retrive the list
    List<String>? existingList = await prefs.getStringList('tasks');
    if (existingList == null) {
      existingList = [];
    }
    //add list back to local storage
    await prefs.setStringList('tasks', newlist);
  }

  void loadfromlocal() async {
    //get insatnce
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //retrive the list
    List<String>? existingList = await prefs.getStringList('tasks');
    if (existingList == null) {
      existingList = [];
    }
    List<Task> newlist = [];
    existingList.forEach((element) {
      // converting the jsonstring to map
      Map<String, dynamic> json = jsonDecode(element);
      //create a Task object add it to newlist
      newlist.add(Task.fromMap(json));
    });
    setState(() {
      //add the newlist to Task
      Tasks = newlist;
    });
  }

  List<String> imagelinks = [
    "assets/images/bgimage_1.jpg",
    "assets/images/bgimage_2.jpg",
    "assets/images/bgimage_3.jpg",
    "assets/images/bgimage_4.jpg",
  ];
  var random = Random();

  // to add new task
  void addnewtask(String taskname) {
    Task newtask = Task(taskName: taskname, isDone: false);
    setState(() {
      Tasks.add(newtask);
    });
    addtolocal(Tasks); //to add data to localstorage
  }

  //update task
  void updatetask(Task object) {
    if (!object.isDone) {
      object.isDone = true;
    } else {
      object.isDone = false;
    }
    addtolocal(Tasks); //to add updated data to localstorage
  }

  // to delete task
  void deletetask(int index) {
    setState(() {
      Tasks.removeAt(index);
    });
    addtolocal(Tasks); //to add updated data to localstorage after deletion
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
    loadfromlocal();
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
        body: SafeArea(
          child: TaskList(
            tasklist: Tasks,
            deletetask: deletetask,
            updatetask: updatetask,
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white54,
            onPressed: createNewTask,
            child: Icon(Icons.add)),
      ),
    );
  }
}
