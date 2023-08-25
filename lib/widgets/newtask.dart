import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/task_operations.dart';

class NewTask extends StatefulWidget {
  final Function updateCallback;
  const NewTask({super.key, required this.updateCallback});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final taskController = TextEditingController();

  void addTask() {
    final taskName = taskController.text.trim();
    if (taskName.isNotEmpty) {
      addnewtask(taskname: taskName, updateCallback: widget.updateCallback);
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
        height: 150,
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: taskController,
              decoration: InputDecoration(hintText: "Enter Task here"),
            ),
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
