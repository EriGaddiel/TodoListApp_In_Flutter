import 'package:flutter/material.dart';

import '../model/task.dart';



class TaskBox extends StatelessWidget {

  final Task task;
  final onTaskChanged;
  final Widget Function(BuildContext) deleteDailog;

  const TaskBox({
    super.key, 
    required this.task, 
    required this.onTaskChanged,
    required this.deleteDailog
  });

  @override
  Widget build(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(bottom: 5.0, top: 20.0),
      child: ListTile(
        onTap: (){
          onTaskChanged(task);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          task.isDone? Icons.check_box : Icons.check_box_outline_blank, 
          color: Colors.blue[500],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.taskName!, style: TextStyle(fontSize: 20.0, decoration: task.isDone? TextDecoration.lineThrough : null),),
                Text(task.taskDate!, style: TextStyle(fontSize: 12.0),)
              ],
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(color: Colors.blue, icon: Icon(Icons.edit), iconSize: 25, onPressed: (){print("Edit..");},),
              IconButton(color: Colors.red, icon: Icon(Icons.delete), iconSize: 25, onPressed: (){showDialog(context: context, builder: deleteDailog);},),
            ],
            )
          ]
        )
      ),
    );

    }
}
