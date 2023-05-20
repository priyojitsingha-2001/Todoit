class Task {
  int? id;
  String taskName;
  bool isDone;

  //constructor
  Task({this.id, required this.taskName, required this.isDone});

  //Converting the data to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskname': taskName,
      'isDone': isDone,
    };
  }

  //for debugging purpose
  @override
  String toString() {
    return 'Task(id:$id,taskname:$taskName,isdone:$isDone)';
  }
}
