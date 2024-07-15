import 'package:flutter/material.dart';

import '../widgets/taskBox.dart';
import '../widgets/searchbox.dart';
import '../widgets/notask.dart';
import '../widgets/deleteDialog.dart';

import '../model/task.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoList = Task.todoList(); 
  List<Task> _foundTask = [];

  final _todoController1 = TextEditingController();
  final _todoController2 = TextEditingController();
  final _todoController3 = TextEditingController();

  @override

  void initState() {
    _foundTask = todoList;
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('TodoList', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue[500]),),
        actions: [
          Icon(Icons.menu,)
        ],
      ),

      body: ListView(
        padding: EdgeInsets.all(20.0),  
        children: [
          // For search bar 
          searchBox(onChanged: (value) => _filterTask(value)),

          Container(
            margin: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
            child: Text("My tasks", style: TextStyle(color: Colors.black87, fontSize: 30.0, fontWeight: FontWeight.w500,),textAlign: TextAlign.start,),
            
          ),
          if(!_foundTask.isEmpty)
            for(Task task in _foundTask.reversed)
              TaskBox(
                task: task,
                onTaskChanged: _handleTaskChange,
                deleteDailog: (context) => deleteDailog(task: task, onDeleteTask: _handleDeleteTask,),)
          else
            noTask(image_path: 'assets/images/noTask.png', text: "No Task Here"),
        ],
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AddTaskDialog(),
            );
          },
        child: Icon(Icons.add),
      ),
    );

  }


// Dailog Task form
  Widget AddTaskDialog() {
    double sh = MediaQuery.sizeOf(context).height;
    double sw = MediaQuery.sizeOf(context).width;
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),    
      child: SizedBox(
        height: sh * 0.5,
        width:  sw * 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Create New Task', 
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
                ),
              ),

              SizedBox(height: 20,),

              Text(
                "What has to be done?", 
                style: TextStyle(
                  color: Colors.black54
                ),
                ),
              CostumTexField(hint: "Enter a task",controller: _todoController1,),


              SizedBox(height: 50),
              Text(
                "Date & Time", 
                style: TextStyle(
                  color: Colors.black54
                ),
                ),
                CostumTexField(
                  hint: "Enter Date",
                  icon: Icons.calendar_month,
                  controller: _todoController2,
                ),

                SizedBox(height: 10,),
                CostumTexField(
                  hint: "Set the time",
                  icon: Icons.alarm_outlined,
                  controller: _todoController3,
              ),
                
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                    ),
                  onPressed: () {
                    // Add task logic here
                    _addInfo(_todoController1.text, _todoController2.text, _todoController3.text);
                    Navigator.pop(context);
                  },
                  child: Text('Add Task', style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  


// To handle changes on the task if it done or not 
  void _handleTaskChange(Task task){
    setState(() {
    task.isDone = !task.isDone;
  });
  }


// To delete the task 
  void _handleDeleteTask(String id){
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

// Add task
  void _addInfo(String task, String date, String time){
    setState(() {
      todoList.add(Task(id: DateTime.now().millisecond.toString(), taskName: task, taskDate: date, taskTime: time));
    });
  _todoController1.clear();
  _todoController2.clear();
  _todoController3.clear();
  }

  void _filterTask(String keyWord){
    List<Task> results = [];
    if(keyWord.isEmpty){
      results = todoList;
    }else{
      results = todoList.where((element) => element.taskName!.toLowerCase().contains(keyWord.toLowerCase())).toList();
    }

    setState(() {
      _foundTask = results;
    });
  }
}



class CostumTexField extends StatelessWidget {
  const CostumTexField ({
    super.key, 
    required this.hint,
    this.icon,
    this.controller,
  });

  final String hint;
  final IconData?icon;
  final TextEditingController?controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[500]),
        suffixIcon: InkWell(child: Icon(icon, color: Colors.grey,))
        ),
    );
  }
}





