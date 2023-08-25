// this file deals with the code to
// store the list of tasks into
// in local storage using shared_preferences package
// and also fetching it when required

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/models/task.dart';
import 'dart:convert';

List<Task> tasks = [
  // Task(taskName: 'write a blog', isDone: false),
  // Task(taskName: 'leetcode', isDone: false),
];

// this the new task to the taskList in localStorage
void addtolocal(List<Task> tasks) async {
  //convert List<Task> to List<String>
  List<String> newlist = [];
  tasks.forEach((element) {
    // convert element to => map => json string => and add to list
    newlist.add(jsonEncode(element.toMap()));
  });
  //get insatnce
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //retrive the list
  List<String>? existingList = await prefs.getStringList('tasks');
  // if (existingList == null) {
  //   existingList = [];
  // }
  //can be written like this
  existingList ??= [];
  //add list back to local storage
  await prefs.setStringList('tasks', newlist);
}

//this loads the list of tasks from localStorage
void loadfromlocal(Function updateCallback) async {
  //get insatnce
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //retrive the list
  List<String>? existingList = await prefs.getStringList('tasks');
  // if (existingList == null) {
  //   existingList = [];
  // }
  // can be written like this
  existingList ??= [];
  List<Task> newlist = [];
  existingList.forEach((element) {
    // converting the jsonstring to map
    Map<String, dynamic> json = jsonDecode(element);
    //create a Task object add it to newlist
    newlist.add(Task.fromMap(json));
  });
  //add the newlist to Task
  tasks = newlist;
  // setState(() {});
  updateCallback(); // this method triggers UI update
}
