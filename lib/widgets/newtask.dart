import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  final Function(String) addTaskCallback;

  NewTask({super.key, required this.addTaskCallback});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final taskController = TextEditingController();

  void addTask() {
    final taskName = taskController.text.trim();
    if (taskName.isNotEmpty) {
      widget.addTaskCallback(taskName);
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter a task name"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 160,
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: taskController,
              decoration: InputDecoration(hintText: "Enter Task here"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.all(27),
              child: ElevatedButton(
                  onPressed: addTask,
                  child: Text(
                    "save",
                    style: TextStyle(fontSize: 15),
                  ))),
        ]),
      ),
    );
  }
}
