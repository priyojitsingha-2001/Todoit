import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasklist;
  final Function deletetask;
  final Function updatetask;

  TaskList(
      {super.key,
      required this.updatetask,
      required this.deletetask,
      required this.tasklist});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return widget.tasklist.isEmpty
        ? Center(
            child: Text(
              "No Task Left!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.builder(
            itemCount: widget.tasklist.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white60,
                margin: EdgeInsets.all(10),
                elevation: 6,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  leading: Checkbox(
                      value: widget.tasklist[index].isDone,
                      onChanged: (_) {
                        setState(() {
                          // if (!widget.tasklist[index].isDone) {
                          //   widget.tasklist[index].isDone = true;
                          // } else
                          //   widget.tasklist[index].isDone = false;
                          widget.updatetask(widget.tasklist[index]);
                        });
                      }),
                  title: Text(
                    "${widget.tasklist[index].taskName}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      decoration: widget.tasklist[index].isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationThickness: 2.85,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.deletetask(index);
                        });
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                ),
              );
            },
          );
  }
}
