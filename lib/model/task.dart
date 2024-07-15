class Task {
  String id;
  String taskName;
  String taskDate;
  String taskTime;
  bool isDone;

  Task({
    required this.id,
    required this.taskName, 
    required this.taskDate, 
    required this.taskTime, 
    this.isDone = false,
  });



  static List<Task> todoList(){
    return [];
  }
}