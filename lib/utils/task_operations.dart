import 'package:todo_list_app/models/task.dart';
import 'package:todo_list_app/utils/data_storage.dart';

// to add new task
void addnewtask({required String taskname, required Function updateCallback}) {
  Task newtask = Task(taskName: taskname, isDone: false);
  tasks.add(newtask);
  addtolocal(tasks); //to add data to localstorage
  // setState(() {});
  updateCallback();
}

//update task
void updatetask(Task object) {
  if (!object.isDone) {
    object.isDone = true;
  } else {
    object.isDone = false;
  }
  addtolocal(tasks); //to add updated data to localstorage
}

// to delete task
void deletetask(int index, Function updateCallback) {
  tasks.removeAt(index);
  addtolocal(tasks); //to add updated data to localstorage after deletion
  // setState(() {});
  updateCallback();
}
