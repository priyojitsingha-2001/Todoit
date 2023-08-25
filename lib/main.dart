import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/data_storage.dart';
import 'package:todo_list_app/utils/task_operations.dart';

import 'package:todo_list_app/utils/updateBackground.dart';
import 'package:todo_list_app/widgets/appBar.dart';
import 'package:todo_list_app/widgets/newtask.dart';
import 'package:todo_list_app/widgets/tasklist.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // a callback function that calls the setState method
  void _updateUI() {
    setState(() {});
  }

  //show a popup to add new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (_) => NewTask(
              updateCallback: _updateUI,
            ));
  }

  @override
  void initState() {
    loadfromlocal(_updateUI);
    shuffleimagelinks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // this container holds the background image
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('${imagelinks.first}'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar(),
        body: TaskList(
          tasklist: tasks,
          deletetask: deletetask,
          updatetask: updatetask,
          updateCallback: _updateUI,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white54,
            onPressed: createNewTask,
            child: Icon(Icons.add)),
      ),
    );
  }
}
