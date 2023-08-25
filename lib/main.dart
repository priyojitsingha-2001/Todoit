import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/data_storage.dart';
import 'package:todo_list_app/utils/task_operations.dart';

// import 'package:todo_list_app/utils/updateBackground.dart';
import 'package:todo_list_app/widgets/appBar.dart';
import 'package:todo_list_app/widgets/drawer.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBar(),
      body: TaskList(
        tasklist: tasks,
        deletetask: deletetask,
        updatetask: updatetask,
        updateCallback: _updateUI,
      ),
      drawer: drawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[800],
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
