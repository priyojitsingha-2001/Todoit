class Task {
  String taskName = "";
  bool isDone = false;

  //constructor
  Task({required this.taskName, required this.isDone});

  //Converting the data to map
  Map<String, dynamic> toMap() {
    return {
      'taskname': taskName,
      'isDone': isDone,
    };
  }

  //create a object from map/json
  Task.fromMap(Map<String, dynamic> map) {
    this.taskName = map['taskname'];
    this.isDone = map['isDone'];
  }
}
